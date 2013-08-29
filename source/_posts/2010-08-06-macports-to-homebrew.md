---
author: joe
comments: true
date: 2010-08-06 18:00:52
layout: post
title: Macports to Homebrew
wordpress_id: 130
categories:
- dev
tags:
- localdev
- osx
---

Thanks to a new macbook pro with a clean OS install and minimal dev tools, I made the switch from macports to homebrew. Easy enough with a few caveats.

The homebrew people recommend [uninstalling macports first](http://guide.macports.org/#installing.macports.uninstalling).

Then [install homebrew](http://wiki.github.com/mxcl/homebrew/installation).

Everything worked fine until trying to '**brew install imagemagick**'. The compilation fails. This seems to be a [common problem](http://www.google.com/search?q=brew+install+imagemagick+fails&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a).

The quick solution was to '**sudo brew install imagemagick**'. Compilation worked. However, sudo installing ghostscript after installing imagemagick failed to find the jpeg lib which was previously installed without sudo. Yuck!

The final solution was to brew uninstall all image packages (jpeg, libtiff, ghostscript, etc.) and then run the following...

[bash]
$ brew list
git
$ sudo brew install ghostscript
$ sudo brew install imagemagick
$ brew list
ghostscript   imagemagick   jpeg
little-cms   git      jasper      libtiff
pkg-config
[/bash]

I'm not sure if it's possible to install ghostscript and imagemagick without using sudo. I tried several times, and in the end sudo worked where other attempts failed.
