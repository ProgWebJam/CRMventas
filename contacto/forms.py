from django import forms
from .models import Contacto

class FormularioContacto(forms.ModelForm):

    class Meta:

        model = Contacto

        fields = (
            'cliente',
            'nombre',
            'apellido',
            'telefono',
            'correo',
            'celular',
            'image'
        )