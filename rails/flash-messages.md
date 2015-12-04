# Flash Messages

Flash messages are a way to send generic error (or success!) messages from one request to another during a redirect.


```rb
def sign_out
  session.delete(:u_id)
  redirect_to "/", notice: "You have been signed out"
end
```

It's used simply by giving a second argument to `redirect_to`, the arguement is a `Hash`, giving the key of `notice`, `success`, or `warning` with a message as the value. Now rails will remember this flash key/value to use after the redirect to the next page is complete.

Typically the flash messages are displayed in `application.html.erb`, this way setting them in any controller, they will automatically show up regardless of the page redirected to:

```html
<div class='container'>

  <%= flash[:notice] %>
  <%= flash[:success] %>
  <%= flash[:warning] %>

  <%= yield %>
</div>
```

It's also common to wrap the notices in a styled box:

```html
<div class='container'>

  <div class='alert alert-warning'>
    <%= flash[:notice] %>
    <%= flash[:success] %>
    <%= flash[:warning] %>
  </div>

  <%= yield %>
</div>
```

But now if we render this we see an empty alert box, so it is best to wrap the whole thing in a conditional which checks if there are any flash messages to show.

```html
<div class='container'>

  <% if flash.any? %>
    <div class='alert alert-warning'>
      <%= flash[:notice] %>
      <%= flash[:success] %>
      <%= flash[:warning] %>
    </div>
  <% end %>

  <%= yield %>
</div>
```

## Alternate Syntax

Instead of setting a flash message directly as an argument to `redirect_to`, it possible to set it in a seperate line:

```rb
def sign_out
  session.delete(:u_id)
  flash[:notice] "You have been signed out"
  redirect_to "/"
end
```
