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
