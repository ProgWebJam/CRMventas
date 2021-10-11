from django.shortcuts import render, redirect
from contacto.forms import FormularioContacto
from django.contrib import messages
from contacto.models import Contacto
from django.contrib.auth.decorators import login_required

@login_required(login_url='/accounts/acceder')
def listar_contacto(request):
    contactos = Contacto.objects.all()
    return render(request, 'contacto/listar_contacto.html' , {"contactos":contactos})


@login_required(login_url='/accounts/acceder')
def crear_contacto(request):
    if request.method == "POST":
        form = FormularioContacto(request.POST, request.FILES)
        if form.is_valid():
            contacto = form.save(commit=False)
            contacto.propietario_id = request.user.id
            contacto.save()
            nombre_contacto = form.cleaned_data.get("nombre")
            messages.success(request, F"El contato { nombre_contacto } se a creado correctamente")
            return redirect("contacto")
        else:
            for msg in form.error_messages:
                messages.error(request, form.error_messages[msg])

    form = FormularioContacto()
    return render (request, "contacto/crear_contacto.html", {"form":form})

