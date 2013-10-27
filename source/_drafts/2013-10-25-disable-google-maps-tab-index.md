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
