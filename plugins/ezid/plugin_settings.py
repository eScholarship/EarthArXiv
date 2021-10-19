''' Settings for the EZID plugin for Janeway '''
import os

from utils import models
from utils.install import update_settings
from utils.logger import get_logger

from events import logic as event_logic  # We always import this as event_logic

from plugins.ezid import logic


logger = get_logger(__name__)

PLUGIN_NAME = 'EZID DOI Plugin'
DISPLAY_NAME = 'EZID DOI'
DESCRIPTION = 'Use EZID to deposit DOIs for preprints in Janeway.'
AUTHOR = 'California Digital Library'
VERSION = '0.2'
SHORT_NAME = 'ezid'
MANAGER_URL = 'ezid_manager'
JANEWAY_VERSION = "1.3.8"
IS_WORKFLOW_PLUGIN = True
JUMP_URL = 'ezid_article'
HANDSHAKE_URL = 'ezid_articles'
ARTICLE_PK_IN_HANDSHAKE_URL = True
STAGE = 'ezid_plugin'
KANBAN_CARD = 'ezid/elements/card.html'
DASHBOARD_TEMPLATE = 'ezid/elements/dashboard.html'

PLUGIN_PATH = os.path.dirname(os.path.realpath(__file__))

def install():
    ''' install this plugin '''
    plugin, created = models.Plugin.objects.get_or_create(
        name=SHORT_NAME,
        defaults={
            "enabled": True,
            "version": VERSION,
            "display_name": DISPLAY_NAME,
        }
    )

    if created:
        print('Plugin {0} installed.'.format(PLUGIN_NAME))
        update_settings(
            file_path='plugins/doaj_transporter/install/settings.json'
        )
    elif plugin.version != VERSION:
        print('Plugin updated: {0} -> {1}'.format(VERSION, plugin.version))
        plugin.version = VERSION
        plugin.display_name = DISPLAY_NAME
        plugin.save()

    else:
        print('Plugin {0} is already installed.'.format(PLUGIN_NAME))

def register_for_events():
    '''register for events '''
    #TODO: add events we need to listen for here
    pass

def hook_registry():
    ''' connect a hook with a method in this plugin's logic '''
    logger.debug('>>>>>>>>>>>>>>>>> hook_registry called for ezid plugin')
    event_logic.Events.register_for_event(event_logic.Events.ON_PREPRINT_PUBLICATION,
                                          logic.preprint_publication)

