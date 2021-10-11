from django.contrib import admin
from django.urls import path
from .views import listar_oportunidad, crear_oportunidad

urlpatterns = [
    path('listar', listar_oportunidad , name="listar_oportunidad"),
    path('crear', crear_oportunidad , name="crear_oportunidad"),
]
