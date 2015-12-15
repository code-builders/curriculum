/*jslint browser: true*/
/*jslint white: true */

(function() {
  "use strict";

  var selectOptions = [
    {color: "green", name: "Grass"},
    {color: "blue", name: "Water"},
    {color: "yellow", name: "Sand"},
    {color: "pink", name: "Flowers"},
    {color: "gray", name: "Unusable"}
  ]
  , createMenu = function(callbacks) {
      var object, i, button, form = document.createElement("div");
      for (i = 0; i < selectOptions.length; i = i + 1) {
        button = document.createElement("button");
        button.className = "terrain-button";
        button.innerHTML = selectOptions[i].name;
        button.style.backgroundColor = selectOptions[i].color;
        object = {option: selectOptions[i], form: form};
        button.addEventListener("click", callbacks.submit.bind(object));
        form.appendChild(button);
      }
      callbacks.register(form);
    }
  , chooseAPlant = function() {
      var cell = this;
      createMenu({
        register: function(form) {
          cell.appendChild(form);
        },
        submit: function() {
          cell.style.backgroundColor = this.option.color;
          cell.removeChild(this.form);
          return false;
        }
      });
      cell.removeEventListener("click", chooseAPlant);
    }
  , createGrid = function(width, height, callback) {
    var i, row, cell, o
      , el = document.createElement("div");
    el.className = "grid-wrap";
    for (i = 0; i < height; i = i + 1) {
      row = document.createElement("div");
      row.className = "row";
      for (o = 0; o < width; o = o + 1) {
        cell = document.createElement("div");
        cell.className = "cell";
        cell.addEventListener("click", chooseAPlant);
        row.appendChild(cell);
      }
      el.appendChild(row);
    }
    callback(el);
  };

  window.onload = function () {
    var  app = document.getElementById("app")
      , form = document.getElementById("create-grid");
    form.addEventListener("submit", function(event) {
      event.preventDefault();
      var width  = form.children.namedItem("width").value
        , height = form.children.namedItem("height").value;
      createGrid(width, height, function(el) {
        form.style.display = "none";
        app.appendChild(el);
      });
    });
  };

}());
