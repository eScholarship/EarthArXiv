from django.core.management.base import BaseCommand
from django.conf import settings

from submission.models import Article
from plugins.ezid import logic

class Command(BaseCommand):
    """ Takes a journal article ID and mints a DOI via EZID, if the DOI is not yet minted"""
    help = "Mints a DOI for the provided article ID."

    def add_arguments(self, parser):
        parser.add_argument(
            "article_id", help="`id` of article needing a DOI to be minted", type=int
        )

    def handle(self, *args, **options):
        article_id = options['article_id']

        self.stdout.write("Attempting to mint a DOI for article_id={}".format(article_id))

        article = Article.objects.get(id=article_id)
        logic.update_journal_doi(article)