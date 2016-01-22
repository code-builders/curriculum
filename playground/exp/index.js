var express = require("express");
var app = express();

app.get("/", function(req, res) {
  res.send("<h1>Hello</h1>")
});

app.get("/contact", function(req, res) {
  res.send("<h1>Contact</h1>")
});


app.listen(4000, function() {
  console.log("You started the server")
});
