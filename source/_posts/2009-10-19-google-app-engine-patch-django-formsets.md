---
author: joe
date: 2009-10-19 12:55:53
layout: post
title: Ordered Formsets in Google App Engine Patch
categories:
- code
tags:
- django
- google app engine
---

The current version (1.1RC) of [Google App Engine Patch](http://code.google.com/p/app-engine-patch/) does not allow for easy ordering of forms in formsets. Normally, Django obeys a model's Meta.ordering property as the default for formset data. However, Google App Engine Patch fetches unordered data by default.

There may already be an undocumented solution from the Google App Engine Patch team, but here's a slick unobtrusive workaround that provides a lot of flexibility.

First off, we need a new Formset class and formset factory function...

```python
# formsets.py
from django.forms.models import inlineformset_factory
from django.forms.models import BaseInlineFormSet

class OrderedFormset(BaseInlineFormSet):
    def __init__(self, data=None, files=None, instance=None,
                 save_as_new=False, prefix=None):
        qs = ()
        if hasattr(self.form, 'Meta') and hasattr(self.form.Meta, 'ordering'):
            qs = instance.__getattribute__(self.model.__name__.lower()+'_set')
            for i in self.form.Meta.ordering:
                qs.order(i)
        self.instance = instance
        self.save_as_new = save_as_new
        super(BaseInlineFormSet, self).__init__(data, files, prefix=prefix, queryset=qs)

def orderedformset_factory(parent_model, model, **kwargs):
    kwargs['formset'] = OrderedFormset
    fs = inlineformset_factory(parent_model, model, **kwargs)
    return fs
```

Usage is as simple as specifying formset_factory=orderedformset_factory for each formset field...

```python
# forms.py
from formsets import orderedformset_factory

class GuestForm(forms.ModelForm):
    confirmed = forms.BooleanField(required=False)
    class Meta:
        model = Guest
        ordering = ('first_name',)

class EventForm(forms.ModelForm):
    guests = FormSetField(Guest, form=GuestForm, extra=10, can_order=False, formset_factory=orderedformset_factory)
    class Meta:
        model = Event
        ordering = ('number',)
EventForm = FormWithSets(EventForm)
```



