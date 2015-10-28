## Dev tools, Running a server

We are going to start by setting up a basic http server to serve our website instead of just opening the html file directly in a browser.

We want to do this because there are differences in the way files are accessed and delivered once on a real server, and since our project is going to be on a real server we want our development to match so we can expect little problems when we push it to the internet.

### Install NPM

1. Visit https://nodejs.org/en/, download the OS X version of npm
1. Find the downloaded file `node-vX.X.X.pkg`, double click it.
1. Walk through the installation guide.
1. Make sure it's installed correctly by going to your Terminal and typing `node -v`

Npm (node package manager) is essentially the javascript version of rubygems, it allows you to install javascript based tools on your system in an easy command. We are going to install a small tool that acts as a simple local http server.

```sh
npm install http-server -g
```

Now the tool is installed we can use it to start a server. In the terminal `cd` into the root of your personal website project. Run the following to start the server.

```sh
http-server
```

When this server is started it's going to keep a process running in your terminal, so you will need to open a new tab. To stop the server press `control-c`.

Now that the server is running, you can visit http://localhost:8080 to access the server, by default it will serve `index.html`.

Now that a server is serving our html files, there are a couple implications.

When we just open an html file in the browser, the path is relative to the whole computer, so a path to a file would be something like `/Users/Bookis/work/only-html/css/main.css`, the benefit of running a webserver is that the root becomes relative to where the webserver is running from, so these paths will need to change to `/css/main.css`. Also, when using a webserver all paths should begin with `/` and be the whole path form the root of the server to the file.

## Dev Tools

The Chrome Developer tools are incredibly helpful, I want quickly go over a few features we haven't explored yet.

- Elements tab
  - Navigate and view content in raw html
  - View elements in collapsed/expanded groups
  - View in browser box model when hovering over element
  - Edit and delete elements
  - Force element states like hover and visited
- Network tab
  - View all HTTP requests with their status, type, size, and time taken
  - See time profile for entire page and all resources.
  - Easily see failed requests
  - Filter requests by type
  - Search requests with text
- Sources tab
  - View all loaded files by type
  - Inspect the file content
- Console tab
  - View warning and failures
  - Eventually execute javascript
- Phone icon
  - Turn on mobile device mode
  - View the webpage as it would display on nearly any mobile device
  - Throttle the connection to simulate slow internet
  - Change the device pixel ratio
