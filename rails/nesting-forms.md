# Nested Hashes for forms

We've talked about the basics of HTML forms, now we'll look at how to make the values submitted from a form a little more useful. So far our form inputs have looked something like this:

```html
<form>
  <input type="text" name="menu_title" />
  <input type="text" name="menu_description" />

  <input type='submit' />
</form>
```

If this form were filled out and submitted it would go to a rails app and be interpreted into params as:

```rb
{menu_title: "Lunch", menu_description: "Delicious food"}
```

The `name` attribute is the part that is translated into the keys of params. Here we are using `menu_` as a prefix in the `name` attribute to logically keep track of the keys, this is purely for human readability. HTML provides a syntax to group these in a different way which will provide the same human readability but also actually group the values together in a technical way as well.


```html
<form>
  <input type="text" name="menu[title]" />
  <input type="text" name="menu[description]" />

  <input type='submit' />
</form>
```

When we use the `[]` brackets in the name attribute, rails will parse this out differently, essentially it's identifying two keys for each input, the first input is `menu` and `title`. In params this would look like:

```rb
{menu: {title: "Lunch", description: "Delicious Food"}}
```

It has created nested hashes, `menu` being the outer key with a hash as a value, then each distinct value inside the inner hash.

Now the `title` and `description` are not only grouped for our readability but also technically they are grouped together. With `params` we can use `params[:menu]` to return the inner hash.
