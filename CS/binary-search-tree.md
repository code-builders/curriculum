### Binary Search Tree
*Binary search tree* (also called a *sorted binary tree*) are a data structure used for fast searching, insertion, and deleting. A Binary tree is made up of nodes, each node has two (potential) subtrees. The node at the top is called the root.

![Binary Search Tree](https://upload.wikimedia.org/wikipedia/commons/d/da/Binary_search_tree.svg)

Each node also has a value, this is the data you would want to store in the tree which can be anything. A nodes two subtrees are called the *left* and *right* subtrees. For a given node, all values of the *left* subtree nodes are less than the value of that node. And the values of the *right* subtree nodes are all greater than the value of that node. This is a nice organized structure that will allow us to quickly search, insert, and delete nodes, even if we have a large number of items.

```rb
def search_recursive(key, node)
  if node.nil? || node.value == key
    node
  elsif key < node.value
    search_recursive(key, node.left)
  else
    search_recursive(key, node.right)
  end
end
```

Resources
---------
[Interactive Visualization](https://www.cs.usfca.edu/~galles/visualization/BST.html)  
