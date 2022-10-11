from django.contrib import admin
from plugins.ezid.models import *

class RepoEZIDSettingsAdmin(admin.ModelAdmin):
    pass

admin.site.register(RepoEZIDSettings, RepoEZIDSettingsAdmin)
