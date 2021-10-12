from django.contrib import admin
from django.urls import path
from .views import listar_oportunidad, crear_oportunidad, editar_oportunidad , empresa_delete

urlpatterns = [
    path('listar', listar_oportunidad , name="listar_oportunidad"),
    path('crear', crear_oportunidad , name="crear_oportunidad"),
    path('actualizar_oportunidad/<id_oportunidad>', editar_oportunidad, name='actualizar_oportunidad'),
    path('eliminar_oportunidad/<id_oportunidad>', empresa_delete, name='eliminar_oportunidad'),
]
