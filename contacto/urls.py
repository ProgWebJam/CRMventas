from django.contrib import admin
from django.urls import path
from .views import inicio , crear_contacto

urlpatterns = [
    path('', inicio , name="contacto"),
    path('crear', crear_contacto , name="crear_contacto"),
]
