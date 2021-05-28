import re
from django.core.management.base import BaseCommand
from django.conf import settings
from plugins.ezid import logic as ezid
from repository import models
from press import models as press_models
# import pdb #uncomment this for troubleshooting

SHOULDER = settings.EZID_SHOULDER
USERNAME = settings.EZID_USERNAME
PASSWORD = settings.EZID_PASSWORD
OWNER = settings.EZID_OWNER
ENDPOINT_URL = settings.EZID_ENDPOINT_URL

class Command(BaseCommand):
    """ Takes a preprint ID and updates the associated DOI metadata via EZID, if the preprint has a DOI, AND if the preprint is accepted """
    help = "Updates the DOI metadata for the provided preprint ID."

    def add_arguments(self, parser):
        parser.add_argument(
            "short_name", help="`short_name` for the repository containing the preprint for which we need to mint a DOI", type=str)
        parser.add_argument(
            "preprint_id", help="`id` of preprint needing a DOI to be minted", type=str
        )

    def handle(self, *args, **options):

        short_name = options.get('short_name')
        preprint_id = options['preprint_id']

        self.stdout.write("Attempting to update DOI metadata for preprint_id=" + preprint_id)

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


        #debug breakpoint, use to inspect the objects instantiated above
        # pdb.set_trace()

        # reasons we should not even try to mint a DOI...
        # 1) there's already a DOI, 2) the preprint has not been published
        # if preprint.preprint_doi:
        #     raise RuntimeError("Preprint " + preprint_id + " already has a DOI, cannot mint a new one with this utility.")
        if not preprint.is_published():
            raise RuntimeError("Preprint " + preprint_id + " is not yet published, cannot update DOI metadata for an unpublished preprint.")

        #debug breakpoint, use to inspect the preprint object
        # pdb.set_trace()

        # gather metadata required for minting a DOI via EZID
        # site_url = repo.site_url()
        # target_url = site_url + preprint.local_url

        try:
            target_url = repo.site_url(preprint.local_url)
        except AttributeError:
            # let's just grab the first Press object and hope
            first_press = press_models.Press.get_press(None)
            target_url = first_press.repository_path_url(repo, preprint.local_url)

        # target_url = repo.site_url(preprint.local_url)

        #debug breakpoint
        # pdb.set_trace()

        group_title = preprint.subject.values_list()[0][2]
        title = preprint.title
        published_doi = preprint.doi
        accepted_date = {'month':preprint.date_accepted.month, 'day':preprint.date_accepted.day, 'year':preprint.date_accepted.year}
        published_date = {'month':preprint.date_published.month, 'day':preprint.date_published.day, 'year':preprint.date_published.year}
        contributors = ezid.preprintauthors_to_dict(preprint.preprintauthor_set.all())

        #debug breakpoint, use to confirm the metadata gathered above
        # pdb.set_trace()

        ezid_config = {'shoulder': SHOULDER, 'username': USERNAME, 'password': PASSWORD, 'endpoint_url': ENDPOINT_URL, 'owner': OWNER}
        ezid_metadata = {'update_id': preprint.preprint_doi, 'target_url': target_url, 'group_title': group_title, 'contributors': contributors, 'title': title, 'published_doi': published_doi, 'published_date': published_date, 'accepted_date': accepted_date}

        ezid_result = ezid.update_doi_via_ezid(ezid_config, ezid_metadata)

        # if the ezid_result is a string, it's probably a success, check to be sure
        if isinstance(ezid_result, str):
            if ezid_result.startswith('success:'):
                updated_doi = re.search("doi:([0-9A-Z./]+)", ezid_result).group(1)
                self.stdout.write(self.style.SUCCESS('DOI metadata successfully updated: ' + updated_doi))
            else:
                self.stdout.write(self.style.ERROR('EZID DOI creation failed for preprint.pk: ' + preprint.pk + ' ...'))
                self.stdout.write(self.style.ERROR('ezid_result: ' + ezid_result))
        else:
            self.stdout.write(self.style.ERROR('EZID DOI creation failed for preprint.pk: ' + preprint.pk + ' ...'))
            self.stdout.write(self.style.ERROR(ezid_result.msg))
