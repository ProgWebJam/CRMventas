from django.contrib import admin
from django.urls import path
from .views import listar_cliente, crear_cliente

urlpatterns = [
    path('listar', listar_cliente , name="listar_cliente"),
    path('crear', crear_cliente , name="crear_cliente"),
]
