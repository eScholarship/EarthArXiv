__copyright__ = "Copyright 2017 Birkbeck, University of London"
__author__ = "Martin Paul Eve & Andy Byers"
__license__ = "AGPL v3"
__maintainer__ = "Birkbeck Centre for Technology and Publishing"

# imports from mint_method scratchpad
import re
from urllib.parse import quote
import urllib.request as urlreq
from xmltodict import unparse


# import codecs
# import datetime
# from uuid import uuid4
# import sys
# import re
# import urllib.request as urlreq
# from urllib.parse import quote
# import requests
import pdb #use for debugging, remove this import before using this plugin in production
import json #use for debugging dictionaries

from django.urls import reverse
from django.template.loader import render_to_string
from django.utils.http import urlencode
from django.conf import settings
from django.contrib import messages
from django.utils import timezone

from utils import models as util_models
from utils.function_cache import cache
from utils.logger import get_logger

import time
import types

# KNOWN_SERVERS = {
#     "p": "https://ezid.cdlib.org"
# }


logger = get_logger(__name__)

# EZID_TEST_URL = 'https://api_ezid.org/deposits?test=true'
# EZID_LIVE_URL = 'https://api_ezid.org/deposits'

# TODO: set all of these with settings.py, but keep them hard coded for now
SHOULDER = 'doi:10.15697/' #for the actual plugin, get the value from the settings.py
USERNAME = 'apitest' #for the actual plugin, get the value from the settings.py
PASSWORD = 'apitest' #for the actual plugin, get the value from the settings.py
ENDPOINT_URL = 'https://uc3-ezidx2-stg.cdlib.org'
#URL = 'https://ezid.cdlib.org' #for the actual plugin, get the value from the settings.py
# staging URL is: https://uc3-ezidx2-stg.cdlib.org in case you need it
TARGET_URL = 'https://escholarship.org/'

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
        if author.author.orcid:
            author_list.append({"@sequence": sequence, "@contributor_role": "author", "given_name":  author.author.first_name, "surname": author.author.last_name, "ORCID": author.author.orcid},)
        else:
            author_list.append({"@sequence": sequence, "@contributor_role": "author", "given_name":  author.author.first_name, "surname": author.author.last_name},)


    return author_list

class EzidHTTPErrorProcessor(urlreq.HTTPErrorProcessor):
    ''' Error Processor, required to let 201 responses pass '''
    def http_response(self, request, response):
    # Bizarre that Python leaves this out.
        if response.code == 201:
            return response
        else:
            return urlreq.HTTPErrorProcessor.http_response(self, request, response)
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

#pylint: disable=too-many-arguments
#TODO: clean up this implementation, to bring the number of arguments down under 5)
def mint_doi_via_ezid(shoulder, username, password, endpoint_url, target_url, group_title, contributors, title, posted_date, acceptance_date):
    ''' Sends a mint request for the specified shoulder, via the EZID url, for the specified target '''

    posted_content = {
        "posted_content": {
            "@xmlns": "http://www.crossref.org/schema/4.4.0",
            "@xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
            "@xmlns:jats": "http://www.ncbi.nlm.nih.gov/JATS1",
            "@xsi:schemaLocation": "http://www.crossref.org/schema/4.4.0 http://www.crossref.org/schema/deposit/crossref4.4.0.xsd",
            "group_title": group_title,
            "contributors": contributors,
            "titles": {
                "title": title
            },
            "posted_date": posted_date,
            "acceptance_date": acceptance_date,
            "doi_data": {"doi": "10.50505/preprint_sample_doi_2", "resource": "https://escholarship.org/"}
        }
    }

    metadata = unparse(posted_content).replace('\n', '').replace('\r', '')

    # uncomment this to validate the metadata payload
    # print('\n\n')
    # print('Using this metadata:')
    # print('\n\n')
    # print(unparse(posted_content, pretty=True))

    #uncomment this and the import pdb in the imports above to crank up the debugger
    #pdb.set_trace()

    # These notes will be useful when we move this method to Django, but right now they're useless
    # from django.conf import settings
    # settings.ezid_shoulder
    # settings.ezid_username
    # settings.ezid_password

    # print('\n\n')
    # print('using these values, shoulder: ' + shoulder + '; username: ' + username + '; password: ' + password)
    # print('\n\n')

    # send the mint request
    # print('Sending request to EZID API...\n\n')

    # build the payload
    payload = 'crossref: ' + metadata + '\n_crossref: yes\n_profile: crossref\n_target: ' + target_url + '\n_owner: ' + username

    # print('\n\npayload:\n\n')
    # print(payload)

    result = send_create_request(payload, shoulder, username, password, endpoint_url)
    return result

def preprint_publication(**kwargs):
    ''' hook script for the preprint_publication event '''
    logger.debug('>>> preprint_publication called, mint an EZID DOI...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    target_url = request.press.site_url() + reverse(
        'repository_preprint',
        kwargs={'preprint_id': preprint.pk},
    )

    group_title = preprint.subject.values_list()[0][2]
    title = preprint.title
    accepted_date = {'month':preprint.date_accepted.month,'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
    published_date = {'month':preprint.date_published.month,'day':preprint.date_published.day, 'year':preprint.date_published.year}
    contributors = preprintauthors_to_dict(preprint.preprintauthor_set.all())

    #some notes on the metatdata required for the mint_doi_via_ezid method above:
    # [x] target_url
    # [x] group_title ( preprint.subject.values_list()[0][2] )
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
    logger.debug("contributors: " + ''.join(json.dumps(contributors)))
    logger.debug("accepted_date: " + json.dumps(accepted_date))
    logger.debug("published_date: " + json.dumps(published_date))
    # TODO: add the EZID minting call here
