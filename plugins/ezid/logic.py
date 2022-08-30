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
import json
# import pdb # use for debugging
from django.core.validators import URLValidator, ValidationError
from django.conf import settings
from django.utils import timezone
from django.template.loader import render_to_string
from utils.logger import get_logger
from utils import setting_handler

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

def normalize_author_metadata(preprint_authors):

    ''' returns a list of authors in dictionary format using a list of author objects '''
    #example: {"given_name": "Hardy", "surname": "Pottinger", "ORCID": "https://orcid.org/0000-0001-8549-9354"},
    author_list = []
    for author in preprint_authors:

        # build our new_author dictionary
        new_author = dict()

        contributor = author.account

        if contributor is None:
            logger.warn('A Preprintauthor.account object is None, this should not be possible... skipping null author.')
        else:
            if contributor.first_name:
                new_author['given_name'] = contributor.first_name
            else:
                logger.info('EZID: missing author first name encountered, omitting given_name from EZID minting request...')

            if contributor.last_name:
                new_author['surname'] = contributor.last_name
            else:
                logger.info('EZID: missing author last name encountered, attempting to use first name as surname in EZID minting request, since surname is mandatory...')
                if contributor.first_name:
                    new_author['surname'] = contributor.first_name
                    del new_author['given_name']
                else:
                    logger.warning('EZID: no usable name found for author...')

            if contributor.orcid:
                if contributor.orcid.startswith('http'):
                    usable_orcid = contributor.orcid
                else:
                    usable_orcid = 'https://orcid.org/' + contributor.orcid

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

def send_create_request(data, id, username, password, endpoint_url):
    ''' sends a create request to EZID '''
    method = "PUT"
    path = 'id/doi:{}'.format(encode(id))
    request_url = f"{endpoint_url}/{path}"

    opener = urlreq.build_opener(EzidHTTPErrorProcessor())
    ezid_handler = urlreq.HTTPBasicAuthHandler()
    ezid_handler.add_password("EZID", endpoint_url, username, password)
    opener.add_handler(ezid_handler)

    request = urlreq.Request(request_url)
    request.get_method = lambda: method
    request.add_header("Content-Type", "text/plain; charset=UTF-8")
    request.data = data.encode("UTF-8")

    try:
        connection = opener.open(request)
        response = connection.read()
        return response.decode("UTF-8")

    except urlreq.HTTPError as ezid_error:
        #print("%d %s\n" % (ezid_error.code, ezid_error.msg))
        if ezid_error.fp is not None:
            response = ezid_error.fp.read().decode("utf-8")
            if not response.endswith("\n"):
                response += "\n"
            #print(response)
        return response

def send_mint_request(data, shoulder, username, password, endpoint_url):
    ''' sends a mint request to EZID '''
    method = "POST"
    path = 'shoulder/' + encode(shoulder)

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
           # FIXME: this code throws errors, endswith doesn't work with response
           # if not response.endswith("\n"):
           #     response += "\n"
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
            response = ezid_error.fp.read().decode("utf-8")
            if not response.endswith("\n"):
                response += "\n"
            print(response)

def encode(txt):
    ''' encode a text string '''
    return quote(txt, ":/")

def mint_doi_via_ezid(ezid_config, ezid_metadata, template):
    ''' Sends a mint request for the specified config, using the provided data '''
    # ezid_config dictionary contains values for the following keys: shoulder, username, password, endpoint_url
    # ezid_data dicitionary contains values for the following keys: target_url, group_title, contributors, title, published_date, accepted_date

    # add a timestamp to our metadata, we'll need it
    ezid_metadata['now'] = timezone.now()

    if ezid_metadata.get('published_doi') is not None:
        #we cannot trust that the published_doi has been validated, or is usable as a URL, so let's do that now
        logger.debug('validating published_doi')
        validator = URLValidator()
        try:
            validator(ezid_metadata.get('published_doi'))
        except ValidationError:
            logger.error('invalid URL, published_doi: %s for preprint: %s', ezid_metadata.get('published_doi'), ezid_metadata.get('target_url'))
            del ezid_metadata['published_doi'] # this is not a permanent deletion

    template_context = ezid_metadata
    crossref_template = render_to_string(template, template_context)

    logger.debug(crossref_template)

    metadata = crossref_template.replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    # print('\n\n')
    # print('Using this metadata:')
    # print('\n\n')
    # print(metadata)

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    result = send_mint_request(payload, ezid_config['shoulder'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    return result

def update_doi_via_ezid(ezid_config, ezid_metadata, template):
    ''' Sends an update request for the specified config, using the provided data '''
    # ezid_config dictionary contains values for the following keys: shoulder, username, password, endpoint_url
    # ezid_metadata dicitionary contains values for the following keys: update_id, target_url, group_title, contributors, title, published_date, accepted_date

    # add a timestamp to our metadata, we'll need it
    ezid_metadata['now'] = timezone.now()

    if ezid_metadata.get('published_doi') is not None:
        #we cannot trust that the published_doi has been validated, or is usable as a URL, so let's do that now
        logger.debug('validating published_doi')
        validator = URLValidator()
        try:
            validator(ezid_metadata.get('published_doi'))
        except ValidationError:
            logger.error('invalid URL, published_doi: %s for preprint: %s', ezid_metadata.get('published_doi'), ezid_metadata.get('target_url'))
            del ezid_metadata['published_doi'] # this is not a permanent deletion

    template_context = ezid_metadata
    crossref_template = render_to_string(template, template_context)

    logger.debug(crossref_template)

    metadata = crossref_template.replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    # print('\n\n')
    # print('Using this metadata:')
    # print('\n\n')
    # print(metadata)

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    result = send_update_request(payload, ezid_metadata['update_id'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])
    return result

def create_doi_via_ezid(ezid_config, ezid_metadata, template):
    ''' Sends a create request for the specified config, using the provided data '''

    ezid_metadata['now'] = timezone.now()

    template_context = ezid_metadata
    crossref_template = render_to_string(template, template_context)

    logger.debug(crossref_template)

    metadata = crossref_template.replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    # print('\n\n')
    # print('Using this metadata:')
    # print('\n\n')
    # print(metadata)

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + ezid_metadata['target_url'] + '\n_owner: ' + ezid_config['owner']

    # print('\n\npayload:\n\n')
    # print(payload)

    return send_create_request(payload, ezid_metadata['doi'], ezid_config['username'], ezid_config['password'], ezid_config['endpoint_url'])

def preprint_publication(**kwargs):
    ''' hook script for the preprint_publication event '''
    logger.debug('>>> preprint_publication called, mint an EZID DOI...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    # gather metadata required for minting a DOI via EZID
    target_url = preprint.url

    group_title = preprint.subject.values_list()[0][2]
    title = preprint.title.replace('%', '%25')
    published_doi = preprint.doi
    abstract = preprint.abstract.replace('%', '%25')
    accepted_date = {'month':preprint.date_accepted.month, 'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
    published_date = {'month':preprint.date_published.month, 'day':preprint.date_published.day, 'year':preprint.date_published.year}


    contributors = normalize_author_metadata(preprint.preprintauthor_set.all())

    #some notes on the metatdata required:
    # [x] target_url (direct link to preprint)
    # [x] group_title ( preprint.subject.values_list()[0][2] ) grab the first subject
    # [x] contributors - needs to be a list, with a dictionary per row:
    # "person_name": [{"@sequence": "first", "@contributor_role": "author", "given_name": "Hardy", "surname": "Pottinger", "ORCID": "https://orcid.org/0000-0001-8549-9354"},]
    # (preprint.preprintauthor_set is an object ref, work with it, preprintauthor_set.all() would get you a list of all authors)
    # [x] title (preprint.title)
    # [x] posted_date (preprint.date_published, is a datetime object)
    # [x] acceptance_date (preprint.date_accepted, is a datetime object)

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

    ezid_result = mint_doi_via_ezid(ezid_config, ezid_metadata, 'ezid/posted_content.xml')

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
# def preprint_version_update(**kwargs):
#     ''' hook script for the preprint_version_update event '''
#     logger.debug('>>> preprint_version_update called, update DOI metadata via EZID...')

#     preprint = kwargs.get('preprint')
#     request = kwargs.get('request')

#     logger.debug("preprint.id = " + preprint.id)
#     logger.debug("request: " + request)

def get_journal_metadata(article):
    target_url = article.remote_url

    ezid_config = { 'username': USERNAME,
                    'password': PASSWORD,
                    'endpoint_url': ENDPOINT_URL,
                    'owner': setting_handler.get_setting('Identifiers', 'crossref_registrant', article.journal).processed_value,}
    ezid_metadata = {'target_url': target_url,
                     'article': article,
                     'doi': article.get_doi(),
                     'depositor_name': setting_handler.get_setting('Identifiers', 'crossref_name', article.journal).processed_value,
                     'depositor_email': setting_handler.get_setting('Identifiers', 'crossref_email', article.journal).processed_value,
                     'registrant': setting_handler.get_setting('Identifiers', 'crossref_registrant', article.journal).processed_value,}
    return ezid_config, ezid_metadata

def process_ezid_result(article, action, ezid_result):
    if isinstance(ezid_result, str):
        if ezid_result.startswith('success:'):
            doi = re.search("doi:([0-9A-Z./]+)", ezid_result).group(1)
            logger.debug('DOI {} success: {}'.format(action, doi))
            return True, ezid_result
        else:
            logger.error('EZID DOI {} failed for article.pk: {}...'.format(action, article.pk))
            logger.error('ezid_result: ' + ezid_result)
    else:
        logger.error('EZID DOI {} failed for article.pk: {}...'.format(action, article.pk))
        logger.error(ezid_result.msg)

    return False, ezid_result

def update_journal_doi(article):
    ezid_config, ezid_metadata = get_journal_metadata(article)

    ezid_metadata['update_id'] = article.get_doi()

    ezid_result = update_doi_via_ezid(ezid_config, ezid_metadata, 'ezid/journal_content.xml')

    return process_ezid_result(article, "update", ezid_result)

def register_journal_doi(article):
    ezid_config, ezid_metadata = get_journal_metadata(article)

    ezid_result = create_doi_via_ezid(ezid_config, ezid_metadata, 'ezid/journal_content.xml')

    return process_ezid_result(article, "creation", ezid_result)