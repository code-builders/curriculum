# Google Maps

Google maps is provided by a javascript library downloaded from Google. Before we can load a map we have to setup library within our applications.

1. [Get a key from Google](https://developers.google.com/maps/documentation/javascript/get-api-key)
  - Click on `Get A Key`
  - Click `Continue` with "Create a new project" selected
  - Give the project a name (i.e. `BidFin`)
  - Leave `Accept requests from these HTTP referers` blank
1. Next we are going to add a `script` tag in our HTML to download the maps javascript library on each request.
  - ```html
/* application.html.erb */
<script src="https://maps.googleapis.com/maps/api/js?key=<YOUR API KEY HERE>" type="text/javascript"></script>
```
  - Be sure to replay `<YOUR API KEY HERE>` with the api key that you just obtained
  - <small>note: the `script` tag provided above is different than the Google maps API provides in their documentation, their difference is going to be more efficient, but it slightly more comples, we'll go with the simpler version now, and upgrade later if desired</small>

Ok, now the library is included in our application. This is similar to included `jQuery`, now we have an external library which has a lot of provided functionality. Like `jQuery` defines `$`, google maps defines the `google` variable.

Let's look at the code to load the map onto the page. In a javascript file in your rails application you will do the following:

1. Select an HTML element which will serve as the container for the map (it needs to be created to)
1. Initialize a new map object
1. Give it initial latitude, longitude, and zoom level

So first let's create a div in the HTML which will serve as our maps container.

```html
/* map/index.html.erb */
<div id="map"></div>
```
Pretty simple, we may want to style it to give it a specific width and height.

```css
/* map.scss */
#map {
  width: 600px;
  height: 600px;
}
```

Next we will want to add the javascript:

```js
// map.js
$(function() {
  var mapDiv = $("#map")[0];
  var map = new google.maps.Map(mapDiv, {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
})
```

Here we hardcoded in the Latitude and Longitude. Which isn't ideal, we will probably want to get the latitude and longitude from the users current location, modern browsers have built in support for the current location of the computer, find the [docs here](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation)

```js
// map.js
$(function() {

  navigator.geolocation.getCurrentPosition(function(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    var mapDiv = $("#map")[0];
    var map = new google.maps.Map(mapDiv, {
      center: {lat: latitude, lng: longitude},
      zoom: 8
    });
  });
  
});
```
