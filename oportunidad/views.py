from django.shortcuts import render, redirect
from oportunidad.forms import FormularioOportunidad
from django.contrib import messages
from oportunidad.models import Oportunidad
from django.contrib.auth.decorators import login_required


@login_required(login_url='/accounts/acceder')
def listar_oportunidad(request):
    oportunidades = Oportunidad.objects.all()
    return render( request, 'oportunidad/listar_oportunidad.html', { "oportunidades": oportunidades })


@login_required(login_url='/accounts/acceder')
def crear_oportunidad(request):
    if request.method == "POST":
        form = FormularioOportunidad(request.POST, request.FILES)
        if form.is_valid():
            oportunidad = form.save(commit=False)
            oportunidad.propietario_id = request.user.id
            oportunidad.save()
            nombre_oportunidad = form.cleaned_data.get("nombre")
            messages.success(request, F"La oportunidad { nombre_oportunidad } se a creado correctamente")
            return redirect("oportunidad")
        else:
            for msg in form.error_messages:
                messages.error(request, form.error_messages[msg])

    form = FormularioOportunidad()
    return render (request, "oportunidad/crear_oportunidad.html", {"form":form})


@login_required(login_url='/accounts/acceder')
def editar_oportunidad(request, id_oportunidad):
    oportunidad = Oportunidad.objects.get(id= id_oportunidad)
    if request.method == 'GET':
        form = FormularioOportunidad(instance=oportunidad)
    else:
        form = FormularioOportunidad(request.POST, instance=oportunidad)
        if form.is_valid():
            form.save()
        return redirect('oportunidad')
    return render (request, 'oportunidad/oportunidad_form.html', {'form':form})



@login_required(login_url='/accounts/acceder')
def empresa_delete(request, id_oportunidad):
    oportunidad = Oportunidad.objects.get(id= id_oportunidad)
    if request.method == 'POST':
        oportunidad.delete()
        return redirect('oportunidad')
    return render(request, 'oportunidad/oportunidad_delete.html', {'oportunidad': oportunidad})



