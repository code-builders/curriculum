var greeting = function() {
  return "Hello, I'm " + this.name;
};

var me = {name: "Bookis", sayHello: function() {return "Hello, I'm " + this.name}};
var you = {name: "Daniel", sayHello: me.sayHello}

console.log(me.sayHello())
console.log(you.sayHello());
