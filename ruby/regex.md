# Regular Expressions

Regular expressions (also called regex or regexp) is a language used for pattern detection within strings. For example if we want to detect if a string has the word "gray" in it, but we also are fine with the spelling "grey" would could evaluate a string with ruby to detect if it has either value

```rb
words = "The bird has gray feathers"
words.include?("gray") || words.include?("grey")
```

This would solve the problem but we could solve it using regular expressions too. Regexs are typically defined within two `/` chars, a regex to determine the above problem could be written as: `/gr(a|e)y/`, regex is a common idea within most programming languages, within Ruby there are a few approaches to use a regex:

```rb
words = "The bird has gray feathers"
words.match /gr(a|e)y/
words =~ /gr(a|e)y/
```

These two methods do different things. Both of them return `nil` if a match is not found, but `=~` returns the index of the character where the first match occurred, while `.match` returns the actual matched character.

| Usage | Meaning |
| :------------- | :------------- |
| `[xyz]` | any of the characters contained within. Ranges are also valid such as `[a-z]`.       |
| `[^xyz]` | Any thing **but** the characters contained within.       |
| `.` | Any single character       |
| `\s` | Any whitespace character       |
| `\S` | Any non-whitespace character       |
| `\d` | Any digit       |
| `\D` | Any non digit       |
| `\w` | Any word character       |
| `\W` | Any non word character       |
| `a?` | Zero or one of the `a` character (i.e. an optional character)       |
| `b*` | Zero or more of the `b` character (i.e. an optional repeated characters)       |
| `c+` | One or more of the `c` character (i.e. repeated characters)       |
| `d{3}` | Exactly three `d` characters       |
| `e{3,}` | Three or more `e` characters       |
| `f{3,6}` | Between three and six `f` characters       |


Check out http://rubular.com to test out different matches.
