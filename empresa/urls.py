from django.urls import path
from .views import inicio, crear_empresa

urlpatterns = [
    path('', inicio , name="empresa"),
    path('empresa/crear', crear_empresa , name="crear_empresa"),
]
