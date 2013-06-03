---
author: joe
comments: true
date: 2009-07-20 18:01:39
layout: post
slug: prevent-textmate-from-creating-resource-files-on-network-drives
title: Prevent TextMate From Creating Resource Files on Network Drives
wordpress_id: 84
categories:
- misc
tags:
- localdev
- osx
- textmate
---

In terminal:

[code lang="bash"]
defaults write com.macromates.textmate OakDocumentDisableFSMetaData 1
[/code]

http://manual.macromates.com/en/expert_preferences.html
