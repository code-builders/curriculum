# Linked List Insert

Create a `LinkedList` class (or reuse the one from last time). Add the following methods:

- `.push(value)` Creates a new node and adds it to the end of the linked list
- `.insert_at(value, after_value)` Creates a new node and places it after an existing node with the a `value` which matches the `after_value`

```rb
ll = LinkedList.new(Node.new("a", nxt: Node.new("b")))
ll.push("c")
ll # => <LinkedList @head=<Node @value="a" @nxt=<Node @value="b" @nxt=<Node @value="c">>>>

ll.insert_at("b", "b+")
```
