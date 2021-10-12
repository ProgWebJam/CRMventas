from django.urls import path
from .views import listar_empresa, crear_empresa, editar_empresa, empresa_delete

urlpatterns = [
    path('', listar_empresa , name="empresa"),
    path('empresa/crear', crear_empresa , name="crear_empresa"),
    path('actualizar_empresa/<id_empresa>', editar_empresa , name='actualizar_empresa'),
    path('eliminar_empresa/<id_empresa>', empresa_delete , name='eliminar_empresa'),

]
