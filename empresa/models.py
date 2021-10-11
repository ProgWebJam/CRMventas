from django.db import models
from django.contrib.auth.models import User
from pais.models import Pais


class Empresa(models.Model):

    propietario = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    nit = models.IntegerField(default=1)
    nom_empresa = models.CharField(max_length=300)
    nom_comercial = models.CharField(max_length=300)
    direccion = models.CharField(max_length=300)
    telefono = models.IntegerField(default=1)
    correo = models.EmailField(max_length = 150)
    web = models.URLField(max_length=200)
    pais = models.ForeignKey(Pais, on_delete=models.CASCADE, null=True, blank=True)
    #usu_empresa = models.ManyToManyField(User)
    image = models.ImageField(upload_to='empresa/', blank=True)

    def __str__(self):
        return  self.nom_comercial

    class Meta:
        db_table = 'empresa'
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'
        ordering = ['id']

