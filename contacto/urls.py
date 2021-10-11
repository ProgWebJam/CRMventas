from django.contrib import admin
from django.urls import path
from .views import listar_contacto , crear_contacto

urlpatterns = [
    path('listar', listar_contacto , name="listar_contacto"),
    path('crear', crear_contacto , name="crear_contacto"),
]
