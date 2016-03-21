# JS Interpolation

Javascript does not have string interpolation like Ruby, implement a function which takes two arguments, a string to interpolate and value to interpolate into the string, the string should use the chars `{?}` to determine the location of the second argument should be interpolated in:

```js
str = "The quick brown {?} jumps over the lazy dog"
interpolate(str, "fox")
// "The quick brown fox jumps over the lazy dog"
```

Next make the functions second argument be an array instead of a string, and allow for the string to take multiple `{?}` and interpolate the values of the array in order:


```js
str = "The quick brown {?} jumps over the lazy {?}"
interpolate(str, ["fox", "dog"])
// "The quick brown fox jumps over the lazy dog"
```
