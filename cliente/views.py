from django.http import HttpResponse
from django.shortcuts import render, redirect
from cliente.forms import FormularioCliente
from django.contrib import messages
from cliente.models import Cliente
from django.contrib.auth.decorators import login_required

def inicio(request):
    return HttpResponse("pagina cliente")

@login_required(login_url='/accounts/acceder')
def crear_cliente(request):
    if request.method == "POST":
        form = FormularioCliente(request.POST, request.FILES)
        if form.is_valid():
            cliente = form.save(commit=False)
            cliente.propietario_id = request.user.id
            cliente.save()
            nombre_cliente = form.cleaned_data.get("nom_cliente")
            messages.success(request, F"El cliente { nombre_cliente } se a creado correctamente")
            return redirect("cliente")
        else:
            for msg in form.error_messages:
                messages.error(request, form.error_messages[msg])

    form = FormularioCliente()
    return render (request, "cliente/crear_cliente.html", {"form":form})
