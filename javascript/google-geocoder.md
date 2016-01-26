# Geocoding with Google

When using maps it's very common for users to search for something by address but Google maps uses latitude and longitude (lat/lng) for all positioning on the map.

Google provides an API and javascript library (included in the javascript map library or separately if maps aren't being used) to easily get the lat/lng of a written address:

```js
geocoder = new google.maps.Geocoder();
geocoder.geocode({'address': "3123 Eastlake Ave E, Seattle"}, function(results, status) {
  var lat = results[0].geometry.location.lat();
  var lng = results[0].geometry.location.lng();
  // Do things with lat/lng here
});
```

This can easily be used in combination with a google `Map` object.

```js
geocoder = new google.maps.Geocoder();
geocoder.geocode({'address': address}, function(results, status) {
  var lat = results[0].geometry.location.lat();
  var lng = results[0].geometry.location.lng();
  map.setCenter(results[0].geometry.location);
});
```

See [the docs](https://developers.google.com/maps/documentation/javascript/geocoding) for more info
