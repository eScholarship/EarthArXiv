"""
This module contains the logic for the EZID plugin for Janeway
"""

__copyright__ = "Copyright (c) 2020, The Regents of the University of California"
__author__ = "Hardy Pottinger & Mahjabeen Yucekul"
__license__ = "BSD 3-Clause"
__maintainer__ = "California Digital Library"

import re
from urllib.parse import quote
import urllib.request as urlreq
import json  # use for debugging dictionaries
from collections import OrderedDict
import pdb
import datetime
from uuid import uuid4
from django.conf import settings
from django.template.loader import render_to_string
from xmltodict import unparse
from utils.logger import get_logger


logger = get_logger(__name__)

SHOULDER = settings.EZID_SHOULDER
USERNAME = settings.EZID_USERNAME
PASSWORD = settings.EZID_PASSWORD
OWNER = settings.EZID_OWNER
ENDPOINT_URL = settings.EZID_ENDPOINT_URL

# disable to too many branches warning for PyLint
# pylint: disable=R0912

def orcid_validation_check(input_string):
    ''' Determine whether the given input_string is a valid ORCID '''
    regex = re.compile('https?://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}$')
    match = regex.match(str(input_string))
    return bool(match)

def preprintauthors_to_dict(preprint_authors):

    ''' returns a list of authors in dictionary format using a list of author objects '''
    #example: {"given_name": "Hardy", "surname": "Pottinger", "ORCID": "https://orcid.org/0000-0001-8549-9354"},
    author_list = []
    for author in preprint_authors:

        # build our new_author dictionary
        new_author = dict()

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

def send_update_request(data, update_id, username, password, endpoint_url):
    ''' sends an update request to EZID '''
    method = "POST"
    path = 'id/doi:' + encode(update_id)

    # print('path: ' + path)

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


    template = 'ezid/posted_content.xml'
    template_context = ezid_metadata
    crossref_template = render_to_string(template, template_context)

    logger.debug(crossref_template)

    metadata = crossref_template.replace('\n', '').replace('\r', '')

    # pdb.set_trace()


    # uncomment this to validate the metadata payload
    print('\n\n')
    print('Using this metadata:')
    print('\n\n')
    print(metadata)

    # uncomment this and the import pdb in the imports above to crank up the debugger
    # pdb.set_trace()

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    result = send_create_request(payload, ezid_config['shoulder'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    return result

def update_doi_via_ezid(ezid_config, ezid_metadata):
    ''' Sends an update request for the specified config, using the provided data '''
    # ezid_config dictionary contains values for the following keys: shoulder, username, password, endpoint_url
    # ezid_metadata dicitionary contains values for the following keys: update_id, target_url, group_title, contributors, title, published_date, accepted_date

    # TODO: use update to merge a new dictionary into the posted_content dictionary https://www.askpython.com/python/dictionary/merge-dictionaries
    # TODO: https://www.crossref.org/education/content-registration/content-type-markup-guide/posted-content-includes-preprints/#00086 has docs on the VoR relation

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
            "doi_data": {"doi": ezid_metadata['update_id'], "resource": ezid_metadata['target_url']}

            # TODO: figure out how to add a relation here
            
        }
    }

    # pdb.set_trace()

    #TODO: refactor this to use the posted_content.xml template
    if ezid_metadata.get('published_doi') is not None:
        #FIXME: we cannot trust that the published_doi has been validated, or is usable as a URL, so let's do that now
        posted_content.update(pubished_doi_to_relation_dict(ezid_metadata['published_doi']))

    #TODO: the minting method has logic I need to copy here to use a template

    template = 'ezid/posted_content.xml'
    template_context = ezid_metadata
    crossref_template = render_to_string(template, template_context)

    logger.debug(crossref_template)

    metadata = crossref_template.replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    print('\n\n')
    print('Using this metadata:')
    print('\n\n')
    print(metadata)

    # # uncomment this and the import pdb in the imports above to crank up the debugger
    # pdb.set_trace()

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    # pdb.set_trace()

    # result = send_create_request(payload, ezid_config['shoulder'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    result = send_update_request(payload, ezid_metadata['update_id'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    return result

def preprint_publication(**kwargs):
    ''' hook script for the preprint_publication event '''
    logger.debug('>>> preprint_publication called, mint an EZID DOI...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    # pdb.set_trace()

    # gather metadata required for minting a DOI via EZID
    target_url = preprint.url

    group_title = preprint.subject.values_list()[0][2]
    title = preprint.title
    published_doi = preprint.doi
    abstract = preprint.abstract
    accepted_date = {'month':preprint.date_accepted.month, 'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
    published_date = {'month':preprint.date_published.month, 'day':preprint.date_published.day, 'year':preprint.date_published.year}


    contributors = preprintauthors_to_dict(preprint.preprintauthor_set.all())
    # pdb.set_trace()

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
    ezid_metadata = {'target_url': target_url, 'group_title': group_title, 'contributors': contributors, 'title': title, 'published_date': published_date, 'accepted_date': accepted_date, 'published_doi': published_doi, 'abstract': abstract}

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

# TODO: PUBD-118 fire a metadata update when a new preprint version is created
def preprint_version_update(**kwargs):
    ''' hook script for the preprint_version_update event '''
    logger.debug('>>> preprint_version_update called, update DOI metadata via EZID...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    logger.debug("preprint.id = " + preprint.id)
    logger.debug("request: " + request)

    # pdb.set_trace()

def create_crossref_template(identifier):
    ''' create a crossref metadata XML document for a preprint matching the provided identifier '''
    from utils import setting_handler
    template_context = {
        'batch_id': uuid4(),
        'timestamp': int(round((datetime.datetime.now() - datetime.datetime(1970, 1, 1)).total_seconds())),
        'depositor_name': setting_handler.get_setting('Identifiers', 'crossref_name',
                                                      identifier.article.journal).processed_value,
        'depositor_email': setting_handler.get_setting('Identifiers', 'crossref_email',
                                                       identifier.article.journal).processed_value,
        'registrant': setting_handler.get_setting('Identifiers', 'crossref_registrant',
                                                  identifier.article.journal).processed_value,
        'journal_title': identifier.article.journal.name,
        'journal_issn': identifier.article.journal.issn,
        'date_published': identifier.article.date_published,
        'issue': identifier.article.issue,
        'article_title': '{0}{1}{2}'.format(
            identifier.article.title,
            ' ' if identifier.article.subtitle is not None else '',
            identifier.article.subtitle if identifier.article.subtitle is not None else ''),
        'authors': identifier.article.authors.all(),
        'doi': identifier.identifier,
        'article_url': identifier.article.url,
        'now': timezone.now(),
    }

    # append citations for i4oc compatibility
    template_context["citation_list"] = extract_citations_for_crossref(
        identifier.article)

    # append PDFs for similarity check compatibility
    pdfs = identifier.article.pdfs
    if len(pdfs) > 0:
        template_context['pdf_url'] = identifier.article.pdf_url

    if identifier.article.license:
        template_context["license"] = identifier.article.license.url

    return template_context