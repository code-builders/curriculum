# Array Search

Create a class called `SearchArray` which can search an array either for a single element or for a collection of elements. The initialize should take an array as argument, them implement the following methods to search on the array.

- `.find_element(query)`: Searches through the array to check if the input exists in the array, if so return the element, otherwise return `nil`.
- `.remove_element(query)`: Searches through the array, if the element exists in the array, remove it and return the removed element, otherwise return `nil`

Here is the catch, **don't use `each`, `select`, `delete`, `find`**, or any other `Enumerable` method.


```rb
sa = SearchArray.new(['a','b','c','z'])
sa.find_element("b") # => "b"
sa.find_element("f") # => nil
sa.remove_element("c") => "c"
sa # => <SearchArray #afasdfds @data=['a',b','z']>
```
