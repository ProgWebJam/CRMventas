from django.urls import path
from .views import listar_empresa, crear_empresa

urlpatterns = [
    path('', listar_empresa , name="empresa"),
    path('empresa/crear', crear_empresa , name="crear_empresa"),
]
