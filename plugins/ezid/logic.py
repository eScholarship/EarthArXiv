__copyright__ = "Copyright (c) 2020, The Regents of the University of California"
__author__ = "Hardy Pottinger & Mahjabeen Yucekul"
__license__ = "BSD 3-Clause"
__maintainer__ = "California Digital Library"

import re
from urllib.parse import quote
import urllib.request as urlreq
import json #use for debugging dictionaries
# import pdb
from django.conf import settings
from xmltodict import unparse
from utils.logger import get_logger

logger = get_logger(__name__)

SHOULDER = settings.EZID_SHOULDER
USERNAME = settings.EZID_USERNAME
PASSWORD = settings.EZID_PASSWORD
OWNER = settings.EZID_OWNER
ENDPOINT_URL = settings.EZID_ENDPOINT_URL

def orcid_validation_check(input_string):
    ''' Determine whether the given input_string is a valid ORCID '''
    regex = re.compile('https?://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}$')
    match = regex.match(str(input_string))
    return bool(match)

def preprintauthors_to_dict(preprint_authors):
    ''' returns a list of authors in dictionary format using a list of author objects '''
    #example: {"@sequence": "first", "@contributor_role": "author", "given_name": "Hardy", "surname": "Pottinger", "ORCID": "https://orcid.org/0000-0001-8549-9354"},
    count_authors = 0
    author_list = []
    for author in preprint_authors:
        count_authors = count_authors + 1
        if count_authors == 1:
            sequence = 'first'
        else:
            sequence = 'additional'

        # build our new_author dictionary
        new_author = dict()
        new_author['@sequence'] = sequence
        new_author['@contributor_role'] = 'author'

        if author.author.first_name:
            new_author['given_name'] = author.author.first_name
        else:
            logger.info('EZID: missing author first name encountered, omitting given_name from EZID minting request...')

        if author.author.last_name:
            new_author['surname'] = author.author.last_name
        else:
            logger.info('EZID: missing author last name encountered, attempting to use first name as surname in EZID minting request, since surname is mandatory...')
            if author.author.first_name:
                new_author['surname'] = author.author.first_name
                del new_author['given_name']
            else:
                logger.warning('EZID: no usable name found for author...')

        if author.author.orcid:
            if author.author.orcid.startswith('http'):
                usable_orcid = author.author.orcid
            else:
                usable_orcid = 'https://orcid.org/' + author.author.orcid

            if orcid_validation_check(usable_orcid):
                new_author['ORCID'] = usable_orcid
            else:
                logger.warning('EZID: unsuable ORCID value of "' + usable_orcid + '" encountered, omitting from EZID minting request...')

        author_list.append(new_author)

    return author_list

class EzidHTTPErrorProcessor(urlreq.HTTPErrorProcessor):
    ''' Error Processor, required to let 201 responses pass '''
    def http_response(self, request, response):
        if response.code == 201:
            my_return = response
        else:
            my_return = urlreq.HTTPErrorProcessor.http_response(self, request, response)
        return my_return
    https_response = http_response

def send_create_request(data, shoulder, username, password, endpoint_url):
    ''' sends a create request to EZID '''
    method = "POST"
    path = '/shoulder/' + encode(shoulder)

    opener = urlreq.build_opener(EzidHTTPErrorProcessor())
    ezid_handler = urlreq.HTTPBasicAuthHandler()
    ezid_handler.add_password("EZID", endpoint_url, username, password)
    opener.add_handler(ezid_handler)


    request = urlreq.Request("%s/%s" % (endpoint_url, path))
    request.get_method = lambda: method
    request.add_header("Content-Type", "text/plain; charset=UTF-8")
    request.data = data.encode("UTF-8")

    try:
        connection = opener.open(request)
        response = connection.read()
        return response.decode("UTF-8")

    except urlreq.HTTPError as ezid_error:
        print("%d %s\n" % (ezid_error.code, ezid_error.msg))
        if ezid_error.fp is not None:
            response = ezid_error.fp.read()
            if not response.endswith("\n"):
                response += "\n"
            print(response)

def encode(txt):
    ''' encode a text string '''
    return quote(txt, ":/")

def mint_doi_via_ezid(ezid_config, ezid_metadata):
    ''' Sends a mint request for the specified config, using the provided data '''
    # ezid_config dictionary contains values for the following keys: shoulder, username, password, endpoint_url
    # ezid_data dicitionary contains values for the following keys: target_url, group_title, contributors, title, published_date, accepted_date

    # pdb.set_trace()

    posted_content = {
        "posted_content": {
            "@xmlns": "http://www.crossref.org/schema/4.4.0",
            "@xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
            "@xmlns:jats": "http://www.ncbi.nlm.nih.gov/JATS1",
            "@xsi:schemaLocation": "http://www.crossref.org/schema/4.4.0 http://www.crossref.org/schema/deposit/crossref4.4.0.xsd",
            "@type": 'preprint',
            "group_title": ezid_metadata['group_title'],
            "contributors": ezid_metadata['contributors'],
            "titles": {
                "title": ezid_metadata['title']
            },
            "posted_date": ezid_metadata['published_date'],
            "acceptance_date": ezid_metadata['accepted_date'],
            "doi_data": {"doi": "10.50505/preprint_sample_doi_2", "resource": "https://escholarship.org/"}
        }
    }

    metadata = unparse(posted_content).replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    # print('\n\n')
    # print('Using this metadata:')
    # print('\n\n')
    # print(unparse(posted_content, pretty=True))

    # # uncomment this and the import pdb in the imports above to crank up the debugger
    # pdb.set_trace()

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    result = send_create_request(payload, ezid_config['shoulder'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    return result

def preprint_publication(**kwargs):
    ''' hook script for the preprint_publication event '''
    logger.debug('>>> preprint_publication called, mint an EZID DOI...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    # gather metadata required for minting a DOI via EZID
    target_url = preprint.url

    group_title = preprint.subject.values_list()[0][2]
    title = preprint.title
    accepted_date = {'month':preprint.date_accepted.month, 'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
    published_date = {'month':preprint.date_published.month, 'day':preprint.date_published.day, 'year':preprint.date_published.year}
    contributors_list = preprintauthors_to_dict(preprint.preprintauthor_set.all())

    # load the contributors list into a dictionary
    contributors = {
                "person_name": contributors_list
                }

    #some notes on the metatdata required:
    # [x] target_url (direct link to preprint)
    # [x] group_title ( preprint.subject.values_list()[0][2] ) grab the first subject
    # [x] contributors - needs to be a list, with a dictionary per row:
    # "person_name": [{"@sequence": "first", "@contributor_role": "author", "given_name": "Hardy", "surname": "Pottinger", "ORCID": "https://orcid.org/0000-0001-8549-9354"},]
    # (preprint.preprintauthor_set is an object ref, work with it, preprintauthor_set.all() would get you a list of all authors)
    # [x] title (preprint.title)
    # [x] posted_date (preprint.date_published, is a datetime object)
    # [x] acceptance_date (preprint.date_accepted, is a datetime object)

    # pdb.set_trace() #breakpoint

    logger.debug("preprint url: " + target_url)
    logger.debug("title: " + title)
    logger.debug("group_title: " + group_title)
    logger.debug("contributors: " + json.dumps(contributors))
    logger.debug("accepted_date: " + json.dumps(accepted_date))
    logger.debug("published_date: " + json.dumps(published_date))

    logger.debug('BEGIN MINTING REQUEST...')

    # prepare two dictionaries to feed into the mint_doi_via_ezid function
    ezid_config = {'shoulder': SHOULDER, 'username': USERNAME, 'password': PASSWORD, 'endpoint_url': ENDPOINT_URL, 'owner': OWNER}
    ezid_metadata = {'target_url': target_url, 'group_title': group_title, 'contributors': contributors, 'title': title, 'published_date': published_date, 'accepted_date': accepted_date}

    logger.debug('ezid_config: ' + json.dumps(ezid_config))
    logger.debug('ezid_metadata: '+ json.dumps(ezid_metadata))

    ezid_result = mint_doi_via_ezid(ezid_config, ezid_metadata)

    # if the ezid_result is a string, it's probably a success, check to be sure
    if isinstance(ezid_result, str):
        if ezid_result.startswith('success:'):
            new_doi = re.search("doi:([0-9A-Z./]+)", ezid_result).group(1)
            logger.debug('DOI successfully created: ' + new_doi)
            preprint.preprint_doi = new_doi
            preprint.save()
            logger.debug('DOI added to preprint Janeway object and saved. A preprint is born!')
        else:
            logger.error('EZID DOI creation failed for preprint.pk: ' + preprint.pk + ' ...')
            logger.error('ezid_result: ' + ezid_result)
    else:
        logger.error('EZID DOI creation failed for preprint.pk: ' + preprint.pk + ' ...')
        logger.error(ezid_result.msg)