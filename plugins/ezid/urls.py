from django.conf.urls import url

from plugins.ezid import views


urlpatterns = [
    url(r'^manager/$', views.manager, name='ezid_manager'),
]
