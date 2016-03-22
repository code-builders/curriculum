interpolate = function (str, terms) {
  var term;
  while (terms.length > 0) {
    term = terms.shift()
    str.replace(/{\?}/, term)
  }
  return str
}
// str = "The quick {color} {animal1} jumped over the {color} {animal2}"
// interpolate(str, {color: "Brown", animal1: "Fox", animal2: "Bear"})
