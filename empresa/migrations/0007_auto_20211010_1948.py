# Generated by Django 3.2.8 on 2021-10-11 00:48

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('empresa', '0006_auto_20211010_1921'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='empresa',
            name='propietario',
        ),
        migrations.AddField(
            model_name='empresa',
            name='propietario',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]
