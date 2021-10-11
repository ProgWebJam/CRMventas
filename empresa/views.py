from django.shortcuts import render, redirect
from empresa.forms import FormularioEmpresa
from django.contrib import messages
from empresa.models import Empresa
from django.contrib.auth.decorators import login_required

@login_required(login_url='/accounts/acceder')
def inicio(request):
    empresas = Empresa.objects.all()
    return render( request,'empresa/index.html' , {"empresas":empresas})

@login_required(login_url='/accounts/acceder')

def crear_empresa(request):
    if request.method == "POST":
        form = FormularioEmpresa(request.POST, request.FILES)
        if form.is_valid():
            empresa = form.save(commit=False)
            empresa.propietario_id = request.user.id
            empresa.save()
            nombre_comercial = form.cleaned_data.get("nom_comercial")
            messages.success(request, F"La empresa { nombre_comercial } se a creado correctamente")
            return redirect("empresa")
        else:
            for msg in form.error_messages:
                messages.error(request, form.error_messages[msg])

    form = FormularioEmpresa()
    return render (request, "empresa/crear_empresa.html", {"form":form})

