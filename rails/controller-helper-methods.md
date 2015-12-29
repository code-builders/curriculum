# Controller Helper Methods

So far we've learned about both controller methods and helper methods. Most controller methods are methods which serve an HTML ERB file, but some are just to hold controller logic, these are the ones we are focusing on right now. Examples of these are `set_current_user`, `user_params`, etc... We've also looked at helper methods which are methods which help generate HTML such as `link_to`, `image_tag`, or custom methods like `format_date`.

Occasionally we run across some logic which applies to both the controller and view. There is a way to define methods which will be available to both. The use cases weve seen so far would be: `current_user`, `is_logged_in?`, and `is_admin?`. All of these methods would be used in both the controller and view.

We can make these controller-helper methods by defining them in the controller:

```rb
ApplicationController < ActionController

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end
```

This will make it available to the controller. We can add a single line to make this single method available to the view as well:

```rb
ApplicationController < ActionController

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
```

Now from within the view we can use the method:

```html
<% if current_user %>
  <%= link_to current_user.username, my_account_path %>
<% end %>
```
