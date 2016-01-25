# Geocoding with Google

When using maps it's very common for users to search for something by address but Google maps uses latitude and longitude (lat/lng) for all positioning on the map. Google provides an API and javascript library to easily get the lat/lng of a written address:

```js
geocoder = new google.maps.Geocoder();
geocoder.geocode({'address': "3123 Eastlake Ave E, Seattle"}, function(results, status) {
  var lat = results[0].geometry.location.lat();
  var lng = results[0].geometry.location.lng();
  // Do things with lat/lng here
});
```
