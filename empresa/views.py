from django.shortcuts import render, redirect
from empresa.forms import FormularioEmpresa
from django.contrib import messages
from empresa.models import Empresa
from django.contrib.auth.decorators import login_required
from django.views.generic import UpdateView, DeleteView, DetailView
from django.urls import reverse_lazy


@login_required(login_url='/accounts/acceder')
def listar_empresa(request):
    empresas = Empresa.objects.all()
    return render( request,'empresa/listar_empresa.html' , {"empresas":empresas})

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



@login_required(login_url='/accounts/acceder')
def editar_empresa(request, id_empresa):
    empresa = Empresa.objects.get(id= id_empresa)
    if request.method == 'GET':
        form = FormularioEmpresa(instance=empresa)
    else:
        form = FormularioEmpresa(request.POST, instance=empresa)
        if form.is_valid():
            form.save()
        return redirect('empresa')
    return render (request, 'empresa/oportunidad_form.html', {'form':form})


@login_required(login_url='/accounts/acceder')
def empresa_delete(request, id_empresa):
    empresa = Empresa.objects.get(id= id_empresa)
    if request.method == 'POST':
        empresa.delete()
        return redirect('empresa')
    return render(request, 'empresa/oportunidad_delete.html', {'empresa': empresa})


