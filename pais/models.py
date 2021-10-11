from django.db import models

class Pais(models.Model):

    nombre = models.CharField(max_length=200)

    def __str__(self):

        return self.nombre

    class Meta:
        db_table = 'pais'
        verbose_name = 'Pais'
        verbose_name_plural = 'Paises'
        ordering = ['id']

class Estado(models.Model):

    pais = models.ForeignKey(Pais, on_delete=models.CASCADE, null=True, blank=True)
    nombre = models.CharField(max_length=200)

    def __str__(self):

        return self.nombre

    class Meta:
        db_table = 'estado'
        verbose_name = 'Estado'
        verbose_name_plural = 'Estados'
        ordering = ['id']
