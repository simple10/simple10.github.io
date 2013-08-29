---
author: joe
date: 2009-07-20 18:01:39
layout: post
comments_id: prevent-textmate-from-creating-resource-files-on-network-drives
title: Prevent TextMate From Creating Resource Files on Network Drives
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
