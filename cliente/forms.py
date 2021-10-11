from django import forms
from .models import Cliente

class FormularioCliente(forms.ModelForm):

    class Meta:

        model = Cliente

        fields = (

            'empresa',
            'nit',
            'nom_cliente',
            'nom_comercial_cliente',
            'direccion',
            'telefono',
            'correo',
            'web',
            'pais',
            'image'

        )

        labels = {

            'nom_empresa' : 'nombre cliente empresa',
            'nom_comercial' : 'nombre comercial cliente',

        }

