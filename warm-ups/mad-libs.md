# Mad Libs

> Mad Libs consist of a book that has a short story on each page with many key words replaced with blanks. Beneath each blank is specified a lexical or other category, such as "noun", "verb", "place", or "part of the body".[10] One player asks the other players, in turn, to contribute some word for the specified type for each blank, but without revealing the context for that word. Finally, the completed story is read aloud. The result is usually comic, surreal and somewhat nonsensical.

![Mad Lib](mad-lib.gif)

### Make a Mad Lib

Write a script which `puts`'s a mad lib story into the terminal. Interpolate values from the hash below to fill in blanks within your story. Be sure to use `capitalize`, `upcase`, or any other string modifiers where it makes sense for your sentence.

```rb
words = {
  exclaimation: "ouch",
  adverb: "stupidly",
  verb: "babble",
  noun: "cat",
  adjective: "brave",
  color: "turquoise",
  person: "Boo Radley"
}
```

Before moving on, ask your neighbor for some new words, replace the defaults above with your neighbors answers.

<hr>

### Integrate `Array`

Next, replace the values of each key, but this time have each of the values be arrays of words. In each blank within your story randomly choose a value from the array for the corresponding key.
