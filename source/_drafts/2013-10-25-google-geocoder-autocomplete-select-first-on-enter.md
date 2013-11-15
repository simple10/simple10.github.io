[Google Maps Places Autocomplete](https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete) is awesome. With a few lines of code, you can quickly add an autocompleting places lookup to an input field.
As part of a good UX practice, it's best to also display a map with the geocoded location.

The only major UX problem is how the places autocomplete handles an `ENTER` key press.
By default, the containing form will be submitted. However, this feels unnatural when a
map is present since the expected behavior on `ENTER` is to select the first autocomplete
entry.

Here's how to change the default `ENTER` key press behavior...

```coffeescript
# TODO: add place to map here
displayPlace = (place) ->
  console.log(place)

# Triggered by autocomplete `place_changed` event.
# Autocomplete triggers this user selects an entry or ENTER is pressed.
# https://developers.google.com/maps/documentation/javascript/reference#Autocomplete
onPlaceChanged = ->
  place = autocomplete.getPlace()
  # Place will be set when an autocomplete entry was selected by the user
  if place.geometry
    displayPlace(place)
  # If nothing was selected, it means ENTER was pressed
  else
    selectFirstResult()

selectFirstResult = ->
  # .pac-* classes are the official autocomplete classes
  # Get the first entry by inspecting the DOM
  first = $('.pac-container .pac-item:first').children().map(-> $(this).text() || null)
  first = first.toArray().join(', ')
  # Geocode the text in the first entry to fetch the location data
  geocode(first) if first.length > 0

geocode = (address) ->
  geocoder.geocode address: address, (results, status) =>
    if status == google.maps.GeocoderStatus.OK && results.length
      displayPlace(results[0])
      $el.val(results[0].formatted_address)

# Get the input field
$el = $('input.geocode')

# Disable form submitting on ENTER key press
$el.on 'keypress', (evt) ->
  return false if evt.keyCode == 13

# Fix issue with google resetting the input on blur
$el.on 'blur', (evt) ->
  val = $(evt.currentTarget).val()
  _.defer -> $(evt.currentTarget).val(val)

geocoder = new google.maps.Geocoder
autocomplete = new google.maps.places.Autocomplete($el[0], types: ['geocode'])
autocomplete.addListener('place_changed', onPlaceChanged)
```


Check out Geomappable.
