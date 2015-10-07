# CSV as a Database (DB)

A database is a system of storing and organizing information on a computer. In this case a CSV will act as our database. In most cases a database can be thought of as a table or group of tables:

| ID | Name    |
|:---|:--------|
| 1  | Big Bird    |
| 2  | Elmo  |
| 3  | Cookie Monster |
| 4  | The Count |

We're going to quickly create a CSV to read later, don't worry about this code for now, just copy and paste it. Notice that it created a file named `people.csv` on your computer.
```ruby
people = [[1,"Big Bird"], [2, "Elmo"], [3, "Cookie Monster"], [4, "The Count"]]
CSV.open("people.csv", "w") do |file|
  people.each do |person|
    file << person
  end
end
```

Ruby includes a CSV library used to read and write CSV files. This class is very similar to the `File` class, it's just specifically suited to read and write CSV files.

```ruby
require 'csv'
# Reads the contents of the file into an array of arrays.
CSV.read("people.csv")
# => [["1", "Big Bird"],["2", "Elmo"],["3", "Cookie Monster"],["4", "The Count"]]

# Returns a CSV Object, to be read or manipulated.
csv = CSV.open("people.csv")
# <#CSV io_type:File io_path:"file.csv" encoding:UTF-8 ...>
```

The `open` method requires at least one argument and up to three arguments as well as an optional block.

```ruby
CSV.open(filename, mode='r', options) {|file| block}
```

The required argument is the CSV filename and path. The second argument (`mode`) sets what permissions Ruby has to the file when it is opened. This defaults to `r` (read onle). Possible values are:

|Mode |  Meaning
|:---:|---------------------------------------------------------|
|"r"  |  Read-only, starts at beginning of file  (default mode) |
|"r+" |  Read-write, starts at beginning of file.               |
|"w"  |  Write-only, truncates existing file to zero length     |
|"w+" |  Read-write, truncates existing file to zero length.    |
|"a"  |  Write-only, starts at end of file if file exists.      |
|"a+" |  Read-write, starts at end of file if file exists.      |
|"b"  |  Binary file mode                                       |
|"t"  |  Text file mode                                         |

Most modes will create a new file if one doesn't already exist with the given name.

If you pass a block to `open`, Ruby will open the file, execute the code within the block (the file contents is given to the block as a local variable), and then close the file.

```ruby
require 'csv'
CSV.open("moar_peeps.csv", 'w') do |csv|
  csv << "1,Elise\n2,Karen"
end
```

We can iterate over each line of the file using the `each` method:

```ruby
require 'csv'
CSV.open("markets.csv", 'r').each do |line|
  puts line
end
```

The `.read` method requires one arguement, the filename, and allows for additional options. `.read` first opens the CSV file, then reads the contents of it into a new `Array`. Each row of CSV data is translated into an array as well.

```
# peeps.csv
1,Big Bird
2,Elmo
3,The Count
4,Cookie Monster
```

```ruby
require 'csv'
array_of_peeps = CSV.read("peeps.csv")
ap array_of_peeps
# [
#     [0] [
#         [0] 1,
#         [1] "Big Bird"
#     ],
#     [1] [
#         [0] 2,
#         [1] "Elmo"
#     ],
#     [2] [
#         [0] 3,
#         [1] "The Count"
#     ],
#     [3] [
#         [0] 4,
#         [1] "Cookie Monster"
#     ]
# ]
```
