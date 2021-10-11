from django.db import models
from empresa.models import Empresa
from pais.models import Pais

class Cliente (models.Model):

    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, null=True, blank=True)
    nit = models.IntegerField(default=1)
    nom_cliente = models.CharField(max_length=300)
    nom_comercial_cliente = models.CharField(max_length=300)
    direccion = models.CharField(max_length=300)
    telefono = models.IntegerField(default=1)
    correo = models.EmailField(max_length=300)
    web = models.URLField(max_length=200)
    pais = models.ForeignKey(Pais, on_delete=models.CASCADE, null=True, blank=True)
    #contacto = models.ForeignKey(Pais, on_delete=models.CASCADE, null=True, blank=True)
    image = models.ImageField(upload_to='cliente/', blank=True)


    def __str__(self):

        return self.nom_cliente


    class Meta:
        db_table = 'cliente'
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'
        ordering = ['id']
