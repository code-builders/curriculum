# Highcharts

We're going to create a quick application to build a chart with data coming from a database or API. We are going to use Highcharts, a javascript chart library free for non-commercial use. There are many other chart libraries such as [Google Charts](https://developers.google.com/chart/interactive/docs/gallery/piechart), [Chart.js](http://www.chartjs.org), and [D3.js](http://d3js.org).

First we'll start by adding highcharts to our application by adding a script tag to download the file.

```html
/* application.html.erb */
<%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
<script src="https://code.highcharts.com/highcharts.js"></script>
```

Ok, installed. The highcharts documentation assumes that you are using jQuery, which is convenient because we are.

First we want to add an empty div to our page, this will serve as the container for a chart, we can also go ahead and add some basic sizing to our css:

```html
/*index.html.erb*/
<div id="chart-container">
</div>
```

```css
/* charts.scss */
#chart-container {
  width: 100%;
  margin: 0 auto;
  display: block;
}
```
 If we render the page now, we will see nothing, it's just an empty div. Now we can add javascript to create the chart.


 ```js
 // charts.js
 $(function() {
   $("#chart-container").highcharts({
     title: {
       text: 'Test Chart'
     },
     series: [{
       name: "Test",
       data: [
         {name: "Blah", y: 15},
         {name: "Bah", y: 45},
         {name: "Mah", y: 25}
       ]
     }]
   });
 });
 ```

 In this the `title -> text` key sets the header text above the chart, then the `series` keys is an array, within the array is an object, each object will be a new line, within the objects we have a `name` key, this is the text for the label, then a key of `data`, which is an array of objects, each item has a `name` and `y` key, these are the specific points of data.

 So there we go, we have a chart. But in this case we want a Pie chart, pretty easy to switch:

 ```js
 // charts.js
 $(function() {
   $("#chart-container").highcharts({
     chart: {
       type: "pie",
     },
     title: {
       text: 'Test Chart',
     },
     series: [{
       name: "Test",
       data: [
         {name: "Blah", y: 15},
         {name: "Bah", y: 45},
         {name: "Mah", y: 25}
       ]
     }]
   });
 });
 ```

 Nice, now let's get the data using Ajax. We need to prepare a controller which serves data (we'll do static, but it could come from a database or API).

```rb
# pies_controller.rb
class PiesController < ApplicationController
  def index
    render json: [
      {flavor: "Cherry", votes: 80},
      {flavor: "Apple", votes: 70},
      {flavor: "Blackberry", votes: 90},
      {flavor: "Strawberry Rhubarb", votes: 190}
    ]
  end
end
```

We need to move our highcharts declaration into an ajax call to ensure we have the data from the ajax request.

```js
$(function() {
  $.getJSON("/pies", function(response) {
    var data = response.map(function(pie) {
      return {name: pie.flavor, y: pie.votes}
    });
    $("#chart-container").highcharts({
      chart: {
        type: "pie",
      },
      title: {
        text: 'Pies Chart',
      },
      series: [{
        name: "Pies",
        data: data
      }]
    });
  });
});

```
