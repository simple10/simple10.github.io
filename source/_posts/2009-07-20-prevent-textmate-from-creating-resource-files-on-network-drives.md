---
author: joe
comments: true
date: 2009-07-20 18:01:39
layout: post
title: Prevent TextMate From Creating Resource Files on Network Drives
wordpress_id: 84
categories:
- dev
tags:
- localdev
- osx
- textmate
---

In terminal:

```bash
defaults write com.macromates.textmate OakDocumentDisableFSMetaData 1
```

[TextMate Manual](http://manual.macromates.com/en/expert_preferences.html)
