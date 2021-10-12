from django import forms
from .models import Contacto

class FormularioContacto(forms.ModelForm):

    class Meta:

        model = Contacto

        fields = (
            'usuario_contacto',
            'cliente',
            'nombre',
            'apellido',
            'telefono',
            'correo',
            'celular',
            'image'
        )