---
author: joe
date: 2013-10-25 17:30:00
layout: post
title: How to Disable Google Maps Tab Index
categories:
- code
tags:
- maps
- javascript
- usability
---

By default, the logo and links on an embedded Google Map accept tab focus.
However, if the map is embedded in a form, you probably want tabbing to
skip over the map since the map links have nothing to do with your form.

The easiest way is to wait until the map loads and then set the tabindex
attributes to a high number, effectively disabling tab focus on the map.

```coffeescript
# Empty div
$map = $('.map')

# Init Google Map
gmap = new google.maps.Map($map[0])

# Set tabindex on all <a> elements once map has loaded
listener = gmap.addListener('tilesloaded', =>
  $map.find('a').attr('tabindex', 999)
  google.maps.event.removeListener(listener)
```

Tabindex could also be set to -1, but it's technically not valid HTML5.
Setting tabindex to a sufficiently high number works just fine.
