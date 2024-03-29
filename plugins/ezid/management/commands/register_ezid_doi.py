"""
Janeway Management command for registering DOIs for the EZID plugin
"""

import re
from django.core.management.base import BaseCommand
from plugins.ezid import logic as ezid
from repository import models
from press import models as press_models
# import pdb #uncomment this for troubleshooting

from plugins.ezid.models import RepoEZIDSettings

class Command(BaseCommand):
    """ Takes a preprint ID and mints a DOI via EZID, if the DOI is not yet minted, AND if the preprint is accepted """
    help = "Mints a DOI for the provided preprint ID."

    def add_arguments(self, parser):
        parser.add_argument(
            "short_name", help="`short_name` for the repository containing the preprint for which we need to mint a DOI", type=str)
        parser.add_argument(
            "preprint_id", help="`id` of preprint needing a DOI to be minted", type=str
        )

    def handle(self, *args, **options):

        short_name = options.get('short_name')
        preprint_id = options['preprint_id']

        self.stdout.write("Attempting to mint a DOI for preprint_id=" + preprint_id)

        try:
            repo = models.Repository.objects.get(
                short_name=short_name,
            )
        except models.Repository.DoesNotExist:
            exit('No repository found.')

        try:
            # get the preprint that matches the provided preprint_id
            preprint = models.Preprint.objects.get(repository=repo, pk=preprint_id)
        except models.Preprint.DoesNotExist:
            exit('No preprint found with preprint_id=' + preprint_id)

        # reasons we should not even try to mint a DOI...
        # 1) there's already a DOI, 2) the preprint has not been published
        if preprint.preprint_doi:
            raise RuntimeError("Preprint " + preprint_id + " already has a DOI, if you wish to update the DOI metadata for this preprint, try the update_ezid_doi command instead.")
        if not preprint.is_published():
            raise RuntimeError("Preprint " + preprint_id + " is not yet published, cannot mint a DOI for an unpublished preprint.")

        # gather metadata required for minting a DOI via EZID
        # site_url = repo.site_url()
        # target_url = site_url + preprint.local_url

        try:
            target_url = repo.site_url(preprint.local_url)
        except AttributeError:
            # let's just grab the first Press object and hope
            first_press = press_models.Press.get_press(None)
            target_url = first_press.repository_path_url(repo, preprint.local_url)

        group_title = preprint.subject.values_list()[0][2]
        title = preprint.title.replace('%', '%25')
        abstract = preprint.abstract.replace('%', '%25')
        published_doi = preprint.doi
        accepted_date = {'month':preprint.date_accepted.month, 'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
        published_date = {'month':preprint.date_published.month, 'day':preprint.date_published.day, 'year':preprint.date_published.year}

        contributors = ezid.normalize_author_metadata(preprint.preprintauthor_set.all())

        #debug breakpoint, use to confirm the metadata gathered above
        # pdb.set_trace()

        ezid_settings = RepoEZIDSettings.objects.get(repo=repo)

        ezid_config = {'shoulder': ezid_settings.ezid_shoulder,
                       'username': ezid_settings.ezid_username,
                       'password': ezid_settings.ezid_password,
                       'endpoint_url': ezid_settings.ezid_endpoint_url,
                       'owner': ezid_settings.ezid_owner}
        ezid_metadata = {'target_url': target_url,
                         'group_title': group_title,
                         'contributors': contributors,
                         'title': title,
                         'abstract': abstract,
                         'published_doi': published_doi,
                         'published_date': published_date,
                         'accepted_date': accepted_date}

        ezid_result = ezid.mint_doi_via_ezid(ezid_config, ezid_metadata, 'ezid/posted_content.xml')

        # if the ezid_result is a string, it's probably a success, check to be sure
        if isinstance(ezid_result, str):
            if ezid_result.startswith('success:'):
                new_doi = re.search("doi:([0-9A-Z./]+)", ezid_result).group(1)
                self.stdout.write(self.style.SUCCESS('DOI successfully created: ' + new_doi))
                preprint.preprint_doi = new_doi
                preprint.save()
                self.stdout.write(self.style.SUCCESS('✅ DOI added to preprint Janeway object and saved.'))
            else:
                self.stdout.write(self.style.ERROR('EZID DOI creation failed for preprint.pk: ' + preprint.pk + ' ...'))
                self.stdout.write(self.style.ERROR('ezid_result: ' + ezid_result))
        else:
            self.stdout.write(self.style.ERROR('EZID DOI creation failed for preprint.pk: ' + str(preprint.pk) + ' ...'))
            self.stdout.write(self.style.ERROR(ezid_result.msg))
