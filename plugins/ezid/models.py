from django.db import models

from repository.models import Repository

class RepoEZIDSettings(models.Model):
    repo = models.OneToOneField(Repository)
    ezid_shoulder = models.CharField(max_length=50)
    ezid_owner = models.CharField(max_length=50)

    def __str__(self):
        return "EZID settings: {}".format(self.repo)
