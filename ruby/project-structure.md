# Ruby (gem) project structure

When you have multiple files that all make up one application or tool, technically you can structure the directories and files in anyway that works. But, there is a convention that nearly every project will follow:

```sh
app/
  bin/           # Files for command-line execution
  lib/
    appname.rb
    appname/     # Classes and so on
  Rakefile       # Running tests and common tasks
  README.md
  spec/          # Whichever means of testing you go for
    lib/         # Inside of testing directory should mimic app/lib
  appname.gemspec  
```

Most of these files and directories we haven't learned about yet and are specific to creating a Ruby gem. For classwork we will follow a slimmed down version of this structure:

```
app/
  lib/
    appname.rb
    appname/     # Classes and so on
  README.md
  spec/          # Whichever means of testing you go for
    lib/         # Inside of testing directory should mimic app/lib
```

To break this down file-by-file:

- `app/` the root directory holds all of our files, it should be named appropriately for your application.
  - `lib/` this directory is where all of our code will live
    - `appname.rb` this file is the root of the code, it will require and load all of the other required files.
    - `appname/` this is where all of the custom classes will live.
  - `README` This file will provide written details and documentation for the project
  - `spec` This is where test files go.
    - `lib` The contents of the `spec` folder should mimic the layout of the `app/lib` directory

## Namespacing

This structure has a main file `app/lib/appname.rb`, this is the root of the code, all other code is namespaced using this file. This is useful to avoid collisions in naming with other Libraries. For example, if you create a class named `Bubble`, but then include another project or tool which also has a class of `Bubble`, the two classes would conflict and ruby would be confused about how to keep them separate.

We fix this problem by namespacing all classes for a given project or tool under one `module` or `class`. To do this in the main file `app/lib/appname.rb`, we can define the name that will hold all other classes within the project:

```rb
# app/lib/soapbox.rb
module Soapbox

end
require_relative "soapbox/bubble"
```
Then in the `app/lib/soapbox/bubble` file we can name the class differently to indicate that it is namespaced under the `module Soapbox`.

```rb
# app/lib/soapbox/bubble.rb
class Soapbox::Bubble
  # Normal code here
end
```

Alternately it can be formatted like:

```rb
# app/lib/soapbox/bubble.rb
module Soapbox
  class Bubble
    # Normal code here
  end
end
```
