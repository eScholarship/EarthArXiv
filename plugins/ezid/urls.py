from django.conf.urls import url

from plugins.ezid import views


urlpatterns = [
    url(r'^manager/$', views.ezid_manager, name='ezid_manager'),
]
