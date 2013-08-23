---
author: joe
comments: true
date: 2012-03-24 21:23:02
layout: post
permalink: save-only-changed-attributes-in-backbone-js
title: Save Only Changed Attributes in Backbone.js
wordpress_id: 301
categories:
- backbone.js
- hacks
- jquery
---

{% callout Update date:2013-06-01 %}
As of Backbone 0.9.10, partial model updates are supported with `model.save(attrs, {patch: true})`
{% endcallout %}

Backbone.js syncs all model data to the server by default regardless of what actually changed. This makes a lot of frontend tasks and debugging much easier, but for some models, sending all the data every time is overkill.

Here's a quick extension to backbone models and collections to only sync changes. Just call model.saveChanges instead of model.save and only your changes will be synced.

```coffeescript CoffeeScript
cx_backbone_common =
  sync: (method, model, options) ->
    # Changed attributes will be available here if model.saveChanges was called instead of model.save
    if method == 'update' && model.changedAttributes()
      options.data = JSON.stringify(model.changedAttributes())
      options.contentType = 'application/json';
    Backbone.sync.call(this, method, model, options)

cx_backbone_model =
  # Calling this method instead of set will force sync to only send changed attributes
  # Changed event will not be triggered until after the model is synced
  saveChanges: (attrs) ->
    @save(attrs, {wait: true})

_.extend(Backbone.Model.prototype, cx_backbone_common, cx_backbone_model)
_.extend(Backbone.Collection.prototype, cx_backbone_common)
```