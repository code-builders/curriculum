# Children

Create a `Person` class with the following attributes:

- `name`
- `child_a`
- `child_b`

Create `attr_accessor` for each attribute. Either of the child attributes can be assigned to another `Person` object

```rb
jenny    = Person.new("Jenny")
becky    = Person.new("Becky")
owen     = Person.new("Owen")
alexander  = Person.new("Alexander")
zeno     = Person.new("Zeno")
diogenes = Person.new("Diogenes")


jenny.child_a = owen
jenny.child_b = becky
owen.child_a  = alexander
zeno.child_b  = diogenes

jenny.child_a # => <Person:23423234 @name="Owen">

jenny.child_a.child_a # => <Person:23423234 @name="Alexander">
```
