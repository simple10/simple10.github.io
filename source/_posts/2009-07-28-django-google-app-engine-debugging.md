---
author: joe
date: 2009-07-28 10:26:13
layout: post
title: Django Google App Engine Debugging
categories:
- dev
tags:
- debugging
- django
- google app engine
---

Basic tools and techniques for reference.

### Debugging Templates

```text
{% raw %}
{{ var|pprint }}

{% debug %}
{% endraw %}
```

### Tools

[Debug Toolbar](http://github.com/robhudson/django-debug-toolbar/tree/master)

[FirePython](http://firepython.binaryage.com/)

[pdb](http://docs.python.org/library/pdb.html)

[Winpdb](http://winpdb.org/)

[Django Test Client](http://docs.djangoproject.com/en/dev/topics/testing/?from=olddocs)
