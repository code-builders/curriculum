# What is Rails

Rails is a ruby web application framework. The framework is made up of countless ruby modules and classes to handle all of the different concepts of creating a web application. Some examples of the tasks that rails manages are:

- Receiving HTTP requests
- Security
- Database communication
- Mapping Ruby classes to a database
- Building HTML with Ruby
- Managing cookies and sessions

 All of these things are required for most web applications, in the end a web application just serves HTML, just like a static website, but a static website doesn't have the capability to handle all of those topics.

 ## Building HTML

 The most fundamental piece of a web application is allowing for dynamic HTML, dynamic meaning that the HTML can be different depending on the user, user input, time, external data, etc... This idea is called templating. In Rails the templating is handled by a gem called `erb` (embedded ruby). `erb` allows for html files to be able to contain special tags which Ruby is evaluated within.

 ```html
<h1>The Time Website</h1>
<span class='time'>
  <%= Time.now.strftime("%e %b %Y %H:%M:%S%p") %>
</span>
 ```

 In this example we see the special tags which allow for ruby to be interpreted: `<%= %>`, within these tags any ruby code can be run, the result of the ruby will be inserted into the page. You can imagine that each time this code is executed the time shown is dynamic. In a web application this template would be used, every time a web page is loaded the ruby interprets the file.

 ## Convention over configuration

 The idea of building HTML is a pretty simple one, but Rails doesn't stop there and that is obvious when you look at the files generated in a new rails application, there are tons of files. One of the reasons there are so many files is to create conventions about how things are done, if Rails didn't default to having all of these files, whenever one was needed the developer would need to decide where to place the file and how it should be included in the application. By including all of these files by default gives a convention for how it should be done.

 Before Rails (and similar frameworks), web applications would be built from scratch everytime, starting with an empty directory and adding files and libraries. After doing that too many times the folks at 37signals.com, thought it would be easier to just create a convention for how their applications should be built, this became Rails.
