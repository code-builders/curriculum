# Big O Notation

Big O noYQVhffEoEYuMAxEiXD7NUCaooBEQAstation is a idea used to describe the efficiency (most people will say complexity (pessimists!)) of code (most people will say algorithm (nerds!)).

We can measure complexity by counting the number of times any given line of code is run, we then look at the line that had to run the most time, that line will determine how we work out the complexity. For example, in the following example most lines only run one time, but one line runs 10 times, this line is the basis for complexity.

```rb
def print_array_stuff
  puts "Hello, i'm going to print an arrays contents" # only runs once
  puts "starting now..." # once
  (1..10).to_a.each do |n| #once
    puts n # ten times
  end # once
  puts "Ok, done" #once
end
```
When written Big O is written as `O(How complex the code is)`. So this example would be written `O(10)`.

Let's look at the same example where we give the array to print as an input

```rb
def print_array_stuff(arr)
  puts "Hello, i'm going to print an arrays contents" # only runs once
  puts "starting now..." # once
  arr.each do |n| #once
    puts n # now the size of arr dictates how many times this line runs
           # we could say it runs n times
  end # once
  puts "Ok, done" #once
end
```
So now we can't say `O(10)` because the input array could be any size, the correct way to write this would be `O(n)`.

`0(10)` would never actually be written, Big O is meant to describe how well an algorithm runs at different scales, so if `arr` has 100 elements compared to 1,000,000 elements. Let's look at the most common levels of complexity found in our code.

We are going to go over a few examples, I've written a class to demonstrate some different algorithms, the objects takes an array assigned to `@data` then performs an algorithm on that array, we can looks at the time it takes to perform the algorithm.

### Constant `O(1)`

A constant time algorithm is an algorithm that runs in the same amount of time regardless of the size of the input. Here is an example.

```rb
def is_first_element_nil?
  @data[0] == nil
end
```

The array passed in could be empty or a billion elements, either way it's only going to take a single runthough to get the job done.

What are some other examples of `O(1)`?

### Linear `O(n)`

Our `print_array_stuff` method was `O(n)` or called linear. Linear means that the time it takes is directly proportional to the number of elements. Double the elements double the time.

```rb
def how_many_in_array(search_term)
  total = 0
  @data.each do |d|
    if d == search_term
      total += 1
    end
  end
  total
end
```

This method determins how many of some search term are in the array, since we want to know the total number of matches there is no avoiding at least going over each element once. If there are 1000 things, it has to do 1000 operations, with 2000 it will do twice as many.

### N Squared `O(n²)`

N squared algorithms are typcially algorithms that have nested loops, where we have an `each` in an `each`. So if we have 10 elements for each one it's going to access all 10 elements again. This is a common mistake of the novice programmer, if there is one thing you should take away from this lecture, it's how to avoid n squared code. Here is a trivial example:

```rb
def number_of_combos
  sum = 0
  @data.each do |x|
    @data.each do |y|
      sum += 1
    end
  end
  sum
end
```

In this case if `@data` is 5 items long it takes 25, if it's 50 it takes 2,500. Yikes, this gets really inefficient really fast. **Never do nested loops like this**.

The typical real world example of a n squared algorithm is sorting an unsorted array, specifically the most basic way of sorting called bubble sort. Let's start by watching a demonstration of how a [bubble sort](https://www.youtube.com/watch?v=lyZQPjUT5B4) works.

Here is the ruby code for a bubble sort:

```rb
def bubble_sort
  sorted = false
  until sorted do
    sorted = true
    (0..@data.size-2).each do |i|
      if @data[i] > @data[i + 1]
        temp         = @data[i]
        @data[i]     = @data[i + 1]
        @data[i + 1] = temp
        sorted = false
      end
    end
  end
  @data
end
```

This code is quite complex, but let's try to logic through it to compare to the sorting video we just watched.

### Logarithmic `O(log n)`

Logarithmic algorithms are quite efficient. The general idea is that for each loop, the number of items in the array is cut in half. A common example of this is a search within a sorted array. Specifically what is called a binary search, let's whiteboard out how a binary search works.

Here is the code for a binary search:

```rb
def binary_search(search_term, data=nil)
  data ||= @data
  return if data.empty?
  middle = data.size / 2
  if search_term == data[middle]
    return data[middle]
  elsif search_term > data[middle]
    binary_search(search_term, data[middle+1..-1])
  elsif search_term < data[middle]
    binary_search(search_term, data[0..middle-1])
  end
end
```

This code is even more complex, this is a recursive function (which will be our next CS lecture), meaning that the function uses itself.

### Additional References
[Cheat Sheet](http://bigocheatsheet.com/)  
[More Time Complexity](http://en.wikipedia.org/wiki/Time_complexity)  
[Video](https://www.youtube.com/watch?v=V6mKVRU1evU)  
[Stack Overflow Explanation](http://stackoverflow.com/questions/487258/plain-english-explanation-of-big-o)  
[A beginner's guide](http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/)

![Rosie](resources/rosie.jpg)
