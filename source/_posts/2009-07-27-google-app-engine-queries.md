---
author: joe
date: 2009-07-27 12:51:30
layout: post
title: Google App Engine Queries
categories:
- dev
tags:
- google app engine
---

Often, a model (table) needs to be queried to see if it's empty or not. The fastest way to achieve this is ...

```python
if len(User.all().fetch(1)) == 0
print 'No users'

if len(User.all().fetch(2)) == 1
print 'Only one user'
```

Use this method instead of User.all().count() when testing if any of a specific model exists. This should have better performance in cases where there are lots of the model (e.g. 1000+ Users) since count still needs to access each model in order to count it.
