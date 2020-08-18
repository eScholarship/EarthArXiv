from utils import plugins, models, setting_handler

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
    defaults = {"version": VERSION, "enabled": True}
    plugin, created = models.Plugin.objects.get_or_create(
            name=SHORT_NAME,
            defaults=defaults,
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
    #TODO: add all the hooks we need to use (this is the bulk of the action here)
    EzidPlugin.hook_registry()


def register_for_events():
    #TODO: add events we need to listen for here
    pass
