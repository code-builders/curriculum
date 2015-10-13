# SoapBox

A command-line based social media platform to share short thoughts via synced file systems.

In this project we are going to use object oriented ruby to read and write files, each file will be a post in our social media platform. We will use Dropbox to automatically sync these files across our computers. The files will contain three pieces of information:

1. **Post body**: This is the file name (with spaces and no file extension)
2. **Created at**: This is the system created at time.
3. **Author**: This will be stored in the body of the file

These three things make up a single post. All of the posts will be stored in a shared dropbox directory called `Soapbox`

### Base Requirements

We will all be creating our own clients to read and post to the social media platform from the command line.

- Add the [dropbox app](https://www.dropbox.com/downloading?os=mac) for os x.
- Get added to the shared `Soapbox` directory from bookis
- Create `app.rb` to run from the terminal using `ruby app.rb`. This file will:
  - Read all of the files in your Soapbox directory, sort them by created at time
    - Use the `Bubble` class to create objects which represent each post.
    - print out each file with the body, author, and time
  - Ask if you'd like to make a new post
    - Ask for your username
    - Ask for a new post
    - Write a file with the post as the file name and username as the body of the file
- Create a `bubble.rb` (which is like a tweet, but for soap, get it?). Bubble should have the following attributes:
  - `author`
  - `created_at` as a `DateTime`
  - `body`

### Extended Requirements

- Use the `colorize` gem to print a nicely formatted output for each bubble
- When running the `app.rb` allow print the bubbles but then allow the user to input any of the following to choose their action:
  - Post
  - Refresh
  - Exit
- If Post or Refresh, keep them in the app and ask the question again.
- Save the users username in a local file called `.soapbox`, so they only have to enter it once, running the app in the future should read from the file what their username is.
- Add a `.save` method to a bubble, which actually writes the file for that bubble.
- Create a `SoapboxFiles` class which encapsulates the file reading and sorting methods as class methods.
