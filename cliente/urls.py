from django.contrib import admin
from django.urls import path
from .views import inicio, crear_cliente

urlpatterns = [
    path('', inicio , name="cliente"),
    path('crear', crear_cliente , name="crear_cliente"),
]
