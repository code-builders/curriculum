# Files and Dirs

Ruby has built in classes for reading and writing to files and directories on your computer.

### File

The `File` class provides ways to read and write to a file. Typically the same method is used to read or write, which is `.open` with a filename as an argument and an additional argument clarifying if you want to read or write. `"r"` for read `"w"` for write. To create a new file, we can do:

```rb
file = File.open("test.txt", "w")
# Note that a new file must be in write mode
```

Once we `.open` a file, we can read or write to it, to write we can use the `.write` method:

```rb
file = File.open("test.txt", "w")
file.write "This is a test.\n"
file << "This can also be used to add text to a file\n"
file.close
```

Note that files need to be closed after they are opened, just like in Atom if you don't explicitly close a file, it will stay `open` forever

If the file already exists (or if we've just created it), we can use `"r"` as the second argument to open the file in read mode.

```rb
file = File.open("test.txt", "r")
file.read
file.close
```

The second argument to `.open` (the mode) sets what permissions Ruby has to the file when it is opened. This defaults to `r` (read only). Possible values are:

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
File.open("test.txt", 'w') do |file|
  file << "Some text for our file"
end
```

The `.read` method requires one arguement, the filename.

```rb
File.read "test.txt"
# => "Some text for our file"
```

### Dirs

The ruby class `Dir` is typically used to find files within a directory, just like `ls` in unix. In ruby we can use a method called `.glob` which is like `ls` but allows for pattern matching, so it would be easy to only list `.rb` files or only `.html` files. Often in pattern matching `*` means to match all, same with glob:

```rb
Dir.glob("*")
```

This should list all of the files and directories within your current directory (wherever you started irb from).

These file names could then be used in the `File` class to `.open` and read or write (although, you probably don't want to systematically write to all your files.)
