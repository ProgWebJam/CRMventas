# Generated by Django 3.2.8 on 2021-10-11 17:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0002_auto_20211010_1455'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='image',
            field=models.ImageField(blank=True, upload_to='cliente/'),
        ),
    ]
