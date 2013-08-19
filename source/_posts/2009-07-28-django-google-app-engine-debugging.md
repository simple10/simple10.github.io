---
author: joe
comments: true
date: 2009-07-28 10:26:13
layout: post
slug: django-google-app-engine-debugging
title: Django Google App Engine Debugging
wordpress_id: 88
categories:
- misc
tags:
- debug
- django
- google app engine
---

In templates ...

```
{% raw %}
{{ var|pprint }}

{% debug %}
{% endraw %}
```

Tools

[Debug Toolbar](http://github.com/robhudson/django-debug-toolbar/tree/master)

[FirePython](http://firepython.binaryage.com/)

[pdb](http://docs.python.org/library/pdb.html) (Python Debugger) | [Winpdb](http://winpdb.org/)

[Django Test Client](http://docs.djangoproject.com/en/dev/topics/testing/?from=olddocs)
