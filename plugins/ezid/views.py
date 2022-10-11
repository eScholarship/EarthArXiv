from django.shortcuts import render

from plugins.ezid import forms


def ezid_manager(request):
    form = forms.DummyManagerForm()

    template = 'ezid/manager.html'
    context = {
        'form': form,
    }

    return render(request, template, context)
