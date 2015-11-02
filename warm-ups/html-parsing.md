# HTML Parsing


### Base Requirements

Create a script or class to parse the below html, replace any content with `{{}}` with new value using Rubys `.gsub` method.

The values to use should be:

- `{{title}}`: A title of your choosing, something like "Blog of Bookis".
- `{{name}}`: Your name
- `{{post-title}}`: A title of a blog post that you would like to write.
- `{{post-body}}`: A sentence or two of the blog post.
- `{{post-created_at}}`: Pretend this post was published on October 1st, use the `Time` class and `.strftime` to display the time as "5pm October 1st, 2015". Remember [foragoodstrftime](http://www.foragoodstrftime.com).

```html
<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
```

Use `puts` to display the output in the terminal. The output should not include any of the `{{}}` characters. For example `<h1>{{name}}'s Blog</h1>` should be come `<h1>Bookis's Blog</h1>`.

## Extended requirements

- If you used a script, transfer the above logic to a class.
- Add a method to the class which writes the parsed HTML into a file with the `File` class.
- Allow each value to be passed into `.new`, so generated the HTML can easily be re-used.
- Using the Array below and the HTML below, allow the content between `{{being-posts}}` and `{{end-posts}}` to be replaced for each element in the array.

```rb
  [
    {title: "Blah", body: "Lorem Ipsum", created_at: "October 1st, 2015"},
    {title: "Next Blah", body: "Lorem Ipsum", created_at: "October 15th, 2015"},
    {title: "Last Blah", body: "Lorem Ipsum", created_at: "October 30th, 2015"}
  ]
```

```html
<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      {{begin-posts}}
        <article class='post'>
          <h2>{{post-title}}</h2>
          <p>{{post-body}}</p>
          <span>Posted at: {{post-created_at}}</span>
        </article>
      {{end-posts}}
    </div>
  </body>
</html>
```

-----------

# Play by Play

1. Create a new file
```sh
touch html_parser.rb
```
1. Open the file
```sh
atom html_parser.rb
```
1. Copy and paste the HTML into the file within quotes to make a string, also assign the html string to a variable
```rb
html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"
```
1. Now `html_template` is a variable which is assigned to a large string. Use the `.gsub!` method to replace `{{title}}` with new content. The `!` on the end of `.gsub` means that the variable `html_template` will be directly modified.
```rb
html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"

html_template.gsub!("{{title}}", "Bookis Blogs") # Put whatever title here you'd like
```
1. Use `puts` at the bottom of the file to confirm that the content is correctly being parsed
```rb
html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"

html_template.gsub!("{{title}}", "Bookis Blogs") # Put whatever title here you'd like

puts html_template
```
1. Repeat this process to replace the rest of the content with `{{}}`:
```rb
html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"

html_template.gsub!("{{title}}", "Bookis Blogs")
html_template.gsub!("{{name}}", "Bookis")
html_template.gsub!("{{post-title}}", "Code Builders Students are Awesome")
html_template.gsub!("{{post-body}}", "My time with the code builders students has been super awesome")

puts html_template
```
1. Next we need to use the `Time` class to parse to display a time, we will want to add the time module to the top of our file with `require`.
```rb
require "time"

html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"

html_template.gsub!("{{title}}", "Bookis Blogs")
html_template.gsub!("{{name}}", "Bookis")
html_template.gsub!("{{post-title}}", "Code Builders Students are Awesome")
html_template.gsub!("{{post-body}}", "My time with the code builders students has been super awesome")

puts html_template
```
1. Now we can use the `Time.parse` method to create a date object for October 1st, then use the `.strftime` method to format the time in a human readable way:
```rb
require "time"

html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}'s Blog</h1>
    </div>
    <div class='main'>
      <article class='post'>
        <h2>{{post-title}}</h2>
        <p>{{post-body}}</p>
        <span>Posted at: {{post-created_at}}</span>
      </article>
    </div>
  </body>
</html>
"

html_template.gsub!("{{title}}", "Bookis Blogs")
html_template.gsub!("{{name}}", "Bookis")
html_template.gsub!("{{post-title}}", "Code Builders Students are Awesome")
html_template.gsub!("{{post-body}}", "My time with the code builders students has been super awesome")

oct_first = Time.parse("October 1st, 2015")
html_template.gsub!("{{post-created_at}}", oct_first.strftime("%b %e, %l:%M %p"))

puts html_template
```
