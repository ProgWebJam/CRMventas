from django.db import models
from empresa.models import Empresa
from contacto.models import Contacto

class Oportunidad(models.Model):

    LISTA_ESTADOS = (
        ('p','En_proceso'),
        ('g','Ganada'),
        ('n','No_ganada'),
        ('c','Cancelada(Descartada')
    )

    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, null=True, blank=True)
    contacto = models.ForeignKey(Contacto, on_delete=models.CASCADE, null=True, blank=True)
    nombre = models.CharField(max_length=300)
    monto = models.FloatField()
    estado = models.CharField(max_length=1, choices=LISTA_ESTADOS)

    def __str__(self):

        return self.nombre


    class Meta:
        db_table = 'Oportunidad'
        verbose_name = 'Oportunidad'
        verbose_name_plural = 'Oportunidades'
        ordering = ['id']
