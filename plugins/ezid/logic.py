__copyright__ = "Copyright 2017 Birkbeck, University of London"
__author__ = "Martin Paul Eve & Andy Byers"
__license__ = "AGPL v3"
__maintainer__ = "Birkbeck Centre for Technology and Publishing"

import codecs
import datetime
from uuid import uuid4
import sys
import re
import urllib.request as urlreq
from urllib.parse import quote
import requests
import pdb #use for debugging, remove this import before using this plugin in production

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

KNOWN_SERVERS = {
    "p": "https://ezid.cdlib.org"
}


logger = get_logger(__name__)

EZID_TEST_URL = 'https://api_ezid.org/deposits?test=true'
EZID_LIVE_URL = 'https://api_ezid.org/deposits'
# https://uc3-ezidx2-stg.cdlib.org
# https://ezid.cdlib.org/doc/apidoc.html
#https://github.com/CDLUC3/ezid-client-tools
#  $input = "_crossref: yes\n" . "_profile: crossref\n" . "_target: $escholURL\n" ."_owner: $owner[$journalPath]\n" . "crossref: $crossRefXML";
#  ./classes/article/PublishedArticle.inc.php

# example from the Request tutorial of how to treat a string as a "file" in a POST 
# https://requests.readthedocs.io/en/master/user/quickstart/#post-a-multipart-encoded-file
# url = 'https://httpbin.org/post'
# files = {'file': ('report.csv', 'some,data,to,send\nanother,row,to,send\n')}
# r = requests.post(url, files=files)

# TODO: refactor this method to accept a string for data, and send it
# TODO: write a method to build the xml metadata file string (or swipe one from Janeway if there's one here already)
# TODO: change the indents to match the style required by pyLint

def issueRequest(path, method, data=None, returnHeaders=False,
  streamOutput=False):
  request = urlreq.Request("%s/%s" % (_server, path))
  request.get_method = lambda: method
  if data:
    request.add_header("Content-Type", "text/plain; charset=UTF-8")
    request.data = data.encode("UTF-8")
  if _cookie: request.add_header("Cookie", _cookie)
  try:
    connection = _opener.open(request)
    if streamOutput:
      while True:
        sys.stdout.write(connection.read(1))
        sys.stdout.flush()
    else:
      response = connection.read()
      if returnHeaders:
        return response.decode("UTF-8"), connection.info()
      else:
        return response.decode("UTF-8")
  except urlreq.HTTPError as e:
    sys.stderr.write("%d %s\n" % (e.code, e.msg))
    if e.fp != None:
      response = e.fp.read()
      if not response.endswith("\n"): response += "\n"
      sys.stderr.write(response)
    sys.exit(1)


def preprint_publication(**kwargs):
    ''' hook script for the preprint_publication event '''
    logger.debug('>>> preprint_publication called, mint an EZID DOI...')

    preprint = kwargs.get('preprint')
    request = kwargs.get('request')

    url = request.press.site_url() + reverse(
        'repository_preprint',
        kwargs={'preprint_id': preprint.pk},
    )

    # pdb.set_trace() #breakpoint

    logger.debug("preprint.pk: " + preprint.pk + "; primary author: " + preprint.authors[0] + "; url: " + url + "; title:" + preprint.title)
    # TODO: add the EZID minting call here

    # The easiest thing to do is to just shell out to the ezid3.py script, however, that puts the credentials in the command history, so don't do that

    data = formatAnvlRequest(args[1:])

    # methods to copy over from ezid3.py: formatAnvlRequest, issueRequest
    # variables we need: shoulder