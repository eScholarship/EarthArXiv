# -*- coding: utf-8 -*-
# Generated by Django 1.11.29 on 2022-10-07 17:37
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('repository', '0030_merge_20220613_1628'),
    ]

    operations = [
        migrations.CreateModel(
            name='RepoEZIDSettings',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ezid_shoulder', models.CharField(max_length=50)),
                ('ezid_owner', models.CharField(max_length=50)),
                ('repo', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='repository.Repository')),
            ],
        ),
    ]