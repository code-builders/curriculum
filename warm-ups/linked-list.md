# Linked List

Create a `LinkedList` class. Implement the idea of a linked list:

1. A node has two attributes `value` and `nxt` (`next` is reserved so use `nxt`) and `attr_accessor` for both.
1. When a node is created it can have two arguments
  - `value` (required)
  - `nxt` (optional, should be another node)

Here is an example usage:

```rb
a = LinkedList.new("a")
b = LinkedList.new("b")
a.nxt = b
a.nxt # => <LinkedList #1321231 @value="b">

# OR

a = linkedlist.new("a", LinkedList.new("b"))
a.nxt # => <LinkedList #1321231 @value="b">
```

Create a `.search(term)` instance method on a linked list which takes one argument, the search term. It should compare the value of each element of the list with the term, if an element's value matches that element should be returned. If not elements match the search term, `nil` should be returned.

```rb
a = linkedlist.new("a", LinkedList.new("b"))
a.search("b") # => <LinkedList #1321231 @value="b">
a.search("d") # => nil
```
