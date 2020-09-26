__copyright__ = "Copyright 2017 Birkbeck, University of London"
__author__ = "Martin Paul Eve & Andy Byers"
__license__ = "AGPL v3"
__maintainer__ = "Birkbeck Centre for Technology and Publishing"


import datetime
from uuid import uuid4
import requests
import pdb

from django.urls import reverse
from django.template.loader import render_to_string
from django.utils.http import urlencode
from django.conf import settings
from django.contrib import messages
from django.utils import timezone

import sys
from utils import models as util_models
from utils.function_cache import cache
from utils.logger import get_logger

logger = get_logger(__name__)

EZID_TEST_URL = 'https://api_ezid.org/deposits?test=true'
EZID_LIVE_URL = 'https://api_ezid.org/deposits'
# https://uc3-ezidx2-stg.cdlib.org
# https://ezid.cdlib.org/doc/apidoc.html
#https://github.com/CDLUC3/ezid-client-tools
#  $input = "_crossref: yes\n" . "_profile: crossref\n" . "_target: $escholURL\n" ."_owner: $owner[$journalPath]\n" . "crossref: $crossRefXML";
#  ./classes/article/PublishedArticle.inc.php




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