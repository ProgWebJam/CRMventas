from django.contrib import admin
from django.urls import path
from .views import inicio, crear_oportunidad

urlpatterns = [
    path('', inicio , name="oportunidad"),
    path('crear', crear_oportunidad , name="crear_oportunidad"),
]
