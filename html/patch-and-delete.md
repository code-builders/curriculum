## Patch and Delete

The Patch and Delete HTTP verbs are used to update and delete data on the server. But they are not supported by HTML, which mean that in a form in HTML we cannot do this:

```html
<form action="/test" method="PATCH">
</form>
```

But rails has a different way to determine if a request is supposed to be PATCH or DELETE.

```html
<form action="/test" method="POST">
  <input type='hidden' name="_method" value="PATCH">
</form>
```

And similarly for delete:

```html
<form action="/test/7" method="POST">
  <input type='hidden' name="_method" value="DELETE">
  <input type='submit'>
</form>
