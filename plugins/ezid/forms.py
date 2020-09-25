from django import forms

class EzidAdminForm(forms.Form):
    ezid_enabled = forms.BooleanField(required=False)
    ezid_prefix = forms.CharField(required=False)
    ezid_url = forms.CharField(required=False)


class DummyManagerForm(forms.Form):
    dummy_field = forms.CharField()
