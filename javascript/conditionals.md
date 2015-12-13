# Javascript conditional

Conditionals in Javascript are not very different from Ruby, the only real different is syntax. In Ruby a simple conditional would look like:

```rb
if i == 10
  # ...
end
```

The same condition is javascript puts parens around the comparison, then the block is wrapped in `{}`.

```js
if (i == 10) {
  // ...
}
```

An `else` statement is slightly different, the `else` comes **after** the closing `}` for the if then it has it's own `{}`

```js
if (i == 10) {
  // ...
} else {
  // ...
}
```

An `else if` in javascript is two words seperate words, it's used in the same way as the `else` but has parens after the `if` just like the first `if`

```js
if (i == 10) {
  // ...
} else if (i > 10) {
  // ...
} else {
  // ...
}
```
