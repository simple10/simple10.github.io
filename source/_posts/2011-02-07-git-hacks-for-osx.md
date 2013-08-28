---
author: joe
comments: true
date: 2011-02-07 03:20:33
layout: post
permalink: git-hacks-for-osx
slug: git-hacks-for-osx
title: Git Hacks for OSX
wordpress_id: 246
categories:
- code
tags:
- git
---

Use these git config settings and tools to make your life easier.

[Git tab autocomplete for OSX](http://www.codethatmatters.com/2010/01/git-autocomplete-in-mac-os-x/) - enables tab autocomplete for most git commands

Git autocomplete is super helpful if you have long branch names.

Add the below code to your ~/.gitconfig file to enable color and popular short codes.

```bash
[color]
  ui = auto
[alias]
  co = checkout
  br = branch
  st = status
```

[GitX](http://gitx.frim.nl/) - git graphical viewer - better than gitk

The [brotherbard](https://github.com/brotherbard/gitx) fork of gitx has some recommended improvements.

Thanks to [Ben Woolsey](https://github.com/empact) for all these tips.  Ben is working with us on a new startup.
