''' Settings for the EZID plugin for Janeway '''
from utils import plugins, models
from utils.logger import get_logger

from events import logic as event_logic  # We always import this as event_logic

from plugins.ezid import logic


logger = get_logger(__name__)

PLUGIN_NAME = 'EZID DOI Plugin'
DISPLAY_NAME = 'EZID DOI'
DESCRIPTION = 'Use EZID to deposit DOIs for preprints in Janeway.'
AUTHOR = 'California Digital Library'
VERSION = '0.1'
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


class EzidPlugin(plugins.Plugin):
    ''' define this plugin '''
    plugin_name = PLUGIN_NAME
    display_name = DISPLAY_NAME
    description = DESCRIPTION
    author = AUTHOR
    short_name = SHORT_NAME
    manager_url = MANAGER_URL

    version = VERSION
    janeway_version = JANEWAY_VERSION
    is_workflow_plugin = IS_WORKFLOW_PLUGIN
    stage = STAGE
    handshake_url = HANDSHAKE_URL
    article_pk_in_handshake_url = ARTICLE_PK_IN_HANDSHAKE_URL


def install():
    ''' install this plugin '''
    defaults = {"version": VERSION, "enabled": True}
    plugin, created = models.Plugin.objects.get_or_create(
        name=SHORT_NAME,
        enabled=True,
        defaults=defaults,
    )

    # TODO: get the plugin settings below working in a future version of this plugin

    models.PluginSetting.objects.get_or_create(
        name='ezid_enabled',
        plugin=plugin,
        types='boolean',
        pretty_name="Enable EZID Plugin",
        description='Enable EZID DOI Minter Plugin',
        is_translatable=False
    )

    models.PluginSetting.objects.get_or_create(
        name='ezid_prefix',
        plugin=plugin,
        types='string',
        pretty_name='EZID Prefix',
        description='Prefix to use to mint DOIs using EZID',
        is_translatable=False
    )

    models.PluginSetting.objects.get_or_create(
        name='ezid_url',
        plugin=plugin,
        types='string',
        pretty_name='EZID Endpoint URL',
        description='Endpoint URL to use to mint DOIs using EZID',
        is_translatable=False
    )

    if created:
        print('Plugin {0} installed.'.format(PLUGIN_NAME))
    else:
        if plugin.version != VERSION:
            plugin.version = VERSION
            plugin.save()
            print('Plugin {0} version updated.'.format(PLUGIN_NAME))
        else:
            print('Plugin {0} is already installed.'.format(PLUGIN_NAME))

def hook_registry():
    ''' connect a hook with a method in this plugin's logic '''
    logger.debug('>>>>>>>>>>>>>>>>> hook_registry called for ezid plugin')
    event_logic.Events.register_for_event(event_logic.Events.ON_PREPRINT_PUBLICATION,
                                          logic.preprint_publication)


def register_for_events():
    '''register for events '''
    #TODO: add events we need to listen for here
    pass
