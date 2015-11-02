require "time"

html_template = "<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <div class='header'>
      <h1>{{name}}s Blog</h1>
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

html_template.gsub!("{{title}}", "Bookis Blog")
html_template.gsub!("{{name}}", "Bookis")
html_template.gsub!("{{post-title}}", "Code Builders Students are Awesome")
html_template.gsub!("{{post-body}}", "My time with the code builders students has been super awesome")

oct_first = Time.parse("October 1st, 2015")
html_template.gsub!("{{post-created_at}}", oct_first.strftime("%b %e, %l:%M %p"))

puts html_template
