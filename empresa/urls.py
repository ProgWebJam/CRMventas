from django.urls import path
from .views import lista_empresa, crear_empresa

urlpatterns = [
    path('', lista_empresa , name="empresa"),
    path('empresa/crear', crear_empresa , name="crear_empresa"),
]
