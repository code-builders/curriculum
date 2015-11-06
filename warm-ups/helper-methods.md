## Helper Methods

Rails has a whole bunch of helper methods built in such as `link_to` and `image_tag`. In this warm up you are going to re-create those methods without the help of Rails at all. Create a class called `HtmlHelper`, define the following instance methods on the class:

#### `#link_to(text, path)`

`link_to` will return a string which is a valid HTML `<a>` tag with text, href, and an ending tag. `link_to` requires two arguments, first the text to display between the `<a>` tags, the second will the value assigned to `href`. Use `irb` to help test the output of the method.

#### `#image_tag(filename)`

`image_tag` will return a string which is a valid HTML (self ending)`<img>` tag with the src attributes. `image_tag` requires one argument, the value of the `src` attribute.

#### `#list_tag(list_items)`

`list_tag` will return a string which is a valid HTML `<ul>` element with valid `<li>` elements within. `list_tag` requires one argument which is expected to be an array. For each item in the array add a `<li>` element with text and an ending `</li>`. Close the whole thing with an ending `</ul>`

### Extended requirments

- Add a final optional argument to each of the methods which is the html attributes (like `class` and `id`). The argument should be expecting a hash, and each key/value should be added to the html element as a property value pair.
- Since both methods share the optional argument make sure the code is DRY.
