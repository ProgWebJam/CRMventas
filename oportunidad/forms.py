from django import forms
from .models import Oportunidad

class FormularioOportunidad(forms.ModelForm):

    class Meta:

        model = Oportunidad

        fields = (

            'empresa',
            'contacto',
            'nombre',
            'monto',
            'estado',

        )