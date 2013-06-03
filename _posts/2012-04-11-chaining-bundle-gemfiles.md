---
author: joe
comments: true
date: 2012-04-11 18:38:47
layout: post
slug: chaining-bundle-gemfiles
title: Chaining Bundle Gemfiles
wordpress_id: 307
categories:
- rails3
- ruby
---

Useful little snippet to include gem files inside of each other.

[code language="ruby"]
eval(IO.read(File.expand_path('../somedir/Gemfile', __FILE__)), binding)
[/code]
