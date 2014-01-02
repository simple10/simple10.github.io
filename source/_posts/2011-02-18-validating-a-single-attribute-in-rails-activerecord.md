---
author: joe
date: 2011-02-18 06:14:42
layout: post
title: Validating a Single Attribute in Rails ActiveRecord
categories:
- code
tags:
- rails3
---

Checking a single attribute on a model for validity doesn't seem to be possible in Rails.  Or at least I couldn't find a quick answer googling around or looking through the ActiveRecord code.

What I really want to do is pass a hash into valid? with the attributes I want to validate or have an attribute_valid? method. This level of granularity is often useful in AJAX heavy apps. For instance, checking for username availability and validity as the user types during username selection.

Here's a quick solution for a User model.

```ruby
def attribute_valid?(attr, value)
  u = User.new(attr => value))
  u.valid?
  !u.errors.has_key?(:username)
end
```
