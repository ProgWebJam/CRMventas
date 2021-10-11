from django.db import models
from cliente.models import Cliente

class Contacto(models.Model):

    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, null=True, blank=True)
    nombre = models.CharField(max_length=300)
    apellido = models.CharField(max_length=300)
    telefono = models.IntegerField(default=1)
    correo = models.EmailField(max_length=300)
    celular = models.IntegerField(default=1)
    image = models.ImageField(upload_to='contacto/', blank=True)

    def __str__(self):

        return self.nombre + " " + self.apellido


    class Meta:
        db_table = 'contacto'
        verbose_name = 'Contactos'
        verbose_name_plural = 'Contactos'
        ordering = ['id']
