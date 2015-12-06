#### Controller Filters

Filters are methods that are run before, after or "around" a controller action. We'll focus on the before action here as it is the most common. Before filters can be used for many things, but they commonly help with tasks such as finding things from the database, setting variables, or determining permissions that have to be run on every single request.

The `before_action` method can be used in any controller, it typically lives at the top of the file, just below the class definition. It has one required argument which is the name of the method you want to run as a symbol.

```rb
class TasksController < ApplicationController
  before_action :set_current_user

  def index
    # ...
  end

  def create
    # ...
  end

  def set_current_user
    @current_user = User.find(session[:u_id]) if session[:u_id]
  end
end
```

Now when we run any action from within the `TasksController`, first the `@current_user` variable will be set, if there is not a user signed in it will remain `nil`. So now both the `index` and `create` action will be aware if someone is logged in, as well as any actions we create in the future.


We can also move the `before_action` and the `set_current_user` method to the `ApplicationController` if we want the method to run on literally every request, even if it were a new controller.

```rb
class ApplicationController < ActionController::Base
  # ...

  before_action :set_current_user

  def set_current_user
    @current_user = User.find(session[:u_id]) if session[:u_id]
  end

end
```

`before_action` also takes an optional argument which can help scope and refine when the method is run. The argument is a `Hash` to allow different options to be set. The most common option is `only` which allows you to specify the actions you want this method to run on:

```rb
class ApplicationController < ActionController::Base
  # ...

  before_action :set_current_user, only: [:index, :create]

  def set_current_user
    @current_user = User.find(session[:u_id]) if session[:u_id]
  end

end
```

Similar, but opposite, to `only` is `except` which allows you to specify which actions you do not want to run the method before.

Another common use of a before action is to check for permission to see a page. For example if a user is not logged in, you may want to restrict them from creating a record, so instead you redirect them to a sign in page.

```rb
class ApplicationController < ActionController::Base
  # ...

  before_action :set_current_user, only: [:index, :create]
  before_action :require_login, only: [:create]

  def set_current_user
    @current_user = User.find(session[:u_id]) if session[:u_id]
  end

  def require_login
    if @current_user.blank?
      redirect_to root_path, notice: "You must login to do that."
    end
  end

end
```

[Filters guide](http://guides.rubyonrails.org/action_controller_overview.html#filters)
