# Linked List & Node

In our previous linked list implementations we've had a single `LinkedList` class, with the `value`, `nxt`, and operations like `.find`. But this approach has limitations when we start adding and removing elements so we are going to create a new `LinkedList` class which takes a different approach. `LinkedList` is going to be the *whole* list, and `Node` will be each element in the list.

- Create a `Node` class, this class has the two attributes `value` and `nxt`.
  - `@value` is required on `initialize` while `@nxt` is optional.
- Create a `LinkedList` class, this class will have the following:
  - The attribute `head`, which will point to the first `Node` element in the list
  - And any additional methods we create (in the future) on this class, such as `.insert`, `.delete`, `.each`, `.find`, etc...
  - It can be initialized by giving a single `Node` as an argument to be set as the `head` element


```rb
a = Node.new("a")
ll = LinkedList.new(a)
ll.head => # <Node #ads02983 @value="a" @nxt=nil>
a.nxt = Node.new("b")
ll.head => # <Node #ads02983 @value="a" @nxt=<Node #23563454 @value="b" @nxt=nil>>
```
