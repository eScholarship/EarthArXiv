from django.shortcuts import render

from plugins.ezid import forms


def manager(request):
    form = forms.DummyManagerForm()

    template = 'ezid/manager.html'
    context = {
        'form': form,
    }

    return render(request, template, context)
