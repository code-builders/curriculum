# Bootstrap

Bootstrap is one of many HTML, CSS, and Javascript frameworks to provide common styles, elements, and components.

Installation
------------

Bootstrap can be installed in many ways including just downloading the css files, we are going to start with this simple approach but not all of the features will work, if you want to get the full features (icons), see the gem installation instructions at the bottom of this lecture.

Start by downloading all of the files from [Bootstrap](http://getbootstrap.com/getting-started/#download) by clicking the "Download Bootstrap" button. Find the downloaded directory and within it, copy `css/bootstrap.css` into your application `app/assets/stylesheets/`, and the same with `js/bootstrap.js` into `/app/assets/javascripts`

Moving those files is all you need to do, rails (asset pipeline) will take care of the rest.

Usage
-------

Now we are going to walk through some of the defaults that Bootstrap provides as well as the grid system.

If you load your webpage now you will notice that it looks quite a bit different, Bootstrap is overriding most of the browsers default styling. This is going to help getting a consistent look on any browser.

Bootstrap is built for responsive web design, responsive refers to the ability for your page to adjust elements depending on the size of the screen. We will be designing for all device sizes, a nice way to

To enable the full power of the responsive design we first need to add a `<meta>` tag in the `<head>` element of the `application.html.erb`:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

This meta tag is not specific to bootstrap, but to mobile devices, it specifies that the width of the page should be as wide as the devices screen.

The class of `container` is used to wrap the grid system, it will add a specified width (1170 for desktop) and auto margin:

```html
<div class='container'>
  <%= yield %>
</div>
```

Within a `container` we can use the class of `row` to create one horizontal group of elements.


```html
<div class='row'>
  ...
</div>
```

And within a row we can build the horizontal elements up by columns. A row has a total of 12 columns and any element with the row can take up any number of columns. So if we wanted two element to take up the row each taking 50% of it, we could make them each 6 columns. In Bootstrap we specify the number of columns by adding classes.

In the format of `col-lg-n` (`n` being the number of columns we want it to take). The total of our columns in a row has to stay 12 or under.

We can also adjust the size section of `col-size-n`, this determines which type of screen you want this to take affect, before we used `lg`, but `md`, `sm`, `xs` are also options, these can generally be mapped out as the following:

- `lg` : Desktop
- `md` : Small Desktop or Tablet and larger
- `sm` : Vertical tablet or large horizontal phone and larger
- `xs` : Vertical phone and larger

So with `lg` we only get that style on desktop, anything smaller will use the default width (100%). So we could change this to `col-md-6`, so it would maintain horizontal columns on tablets, but phones would be 100% width (this is a pretty good pattern, it's gets messy to have things side by side on a phone)

Further, we can nest grids, so inside of a `col-size-n` we can have another `row`, then we can put in another grid of twelve. In this case we can create a table like structure with our form.


## Gem installation (optional)

```rb
gem 'bootstrap-sass', '~> 3.3.6'
```
Then run `bundle install` from the Terminal.

Next we'll update our `application.css` to be `application.scss`, this is because Bootstrap uses Sass which is a css pre-processor (extension language).

```sh
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

Next we'll need to replace all of the comments within `application.scss` with sass to import Bootstrap

```css
@import "bootstrap-sprockets";
@import "bootstrap";
```

Then in `application.js` add the following above `require_tree .`:

```js
//= require bootstrap-sprockets
```

### References
[Bootstrap Docs](http://getbootstrap.com/getting-started/)  
[Bootstrap-Sass Gem](https://github.com/twbs/bootstrap-sass)  
