from django.db import models

from repository.models import Repository

class RepoEZIDSettings(models.Model):
    repo = models.OneToOneField(Repository)
    ezid_shoulder = models.CharField(max_length=50)
    ezid_owner = models.CharField(max_length=50)
    ezid_username = models.CharField(max_length=200)
    ezid_password = models.CharField(max_length=200)
    ezid_endpoint_url = models.URLField(max_length=300)

    def __str__(self):
        return "EZID settings: {}".format(self.repo)
