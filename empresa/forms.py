from django import forms
from .models import Empresa

class FormularioEmpresa(forms.ModelForm):

    class Meta:
        model = Empresa
        fields = (
            'nit',
            'nom_empresa',
            'nom_comercial',
            'direccion',
            'telefono',
            'correo',
            'web',
            'pais',
            #'usu_empresa',
            'image'
        )

        labels = {

            'nom_empresa' : 'nombre empresa',
            'nom_comercial' : 'nombre comercial empresa',
            #'usu_empresa': 'usuario empresa',

        }

        widgets = {

            #'propietario': forms.CheckboxSelectMultiple(),

        }
