window.onload = function () {
  var g = document.getElementById("greeting");

  g.innerHTML = "Goodbye";

  g.style.color = "#d3e777";
  g.style.backgroundColor = "black";

  var m = document.getElementById("main");

  var l = m.children.list;
  l.style.color = "pink";

  l.children[0].style.color = "blue"
  l.children[1].innerHTML = "Not a"
  var li = l.children[0]

  li.parentNode.removeChild(li);
  l.appendChild(g);
  l.removeChild(l.children[0]);

  var n = document.createElement("h2");
  n.innerHTML = "I'm an h2";
  m.appendChild(n);

  var bigRed = document.getElementById("big-red");
  bigRed.style.backgroundColor = "red";
  bigRed.style.height = 100;
  bigRed.style.width = 100;
  bigRed.style.borderColor = "red";

  bigRed.addEventListener("click", function (event) {
    event.preventDefault();
    document.body.style.backgroundColor = "red";
    document.body.innerHTML = "";
  });

};
