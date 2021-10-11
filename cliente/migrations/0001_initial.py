# Generated by Django 3.2.8 on 2021-10-10 18:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('pais', '0001_initial'),
        ('empresa', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nit', models.IntegerField(default=1)),
                ('nom_cliente', models.CharField(max_length=300)),
                ('nom_comercial_cliente', models.CharField(max_length=300)),
                ('direccion', models.CharField(max_length=300)),
                ('telefono', models.IntegerField(default=1)),
                ('correo', models.EmailField(max_length=300)),
                ('web', models.URLField()),
                ('empresa', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='empresa.empresa')),
                ('pais', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='pais.pais')),
            ],
        ),
    ]
