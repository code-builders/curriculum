## Deploying to Heroku

Heroku is a cloud platform that allows you to deploy your web applications without needing a server. Let's walk through how to deploy a ruby project.

Heroku uses git to upload an application, it's built this way to use the same workflow we use with collaborating and sharing code.

We will use the [Heroku Toolbelt](https://toolbelt.heroku.com). First we'll use a command that will create a repo on Heroku's server for us to push our application into.

```bash
heroku create cool-app-name
```

Every name for a Heroku app must be unique, so where I used `cool-app-name`, you must use something different, if you cannot think of a name leave it empty and Heroku will come up with a random name for you (this can be changed later). You should see out put that looks similar to:

```bash
Creating cool-app-name... done, stack is cedar
http://cool-app-name.herokuapp.com/ | git@heroku.com:cool-app-name.git
Git remote heroku added
```

The `heroku create` command creates the git repo on Heroku and also automatically adds it as a remote, where typically we've had to use `git remote add <name> <url>`.

Note: The git remote link is automatically named `heroku`, while github defaults to `origin`.

Now push your app to Heroku:
```bash
git push heroku master
```

You can watch the deploy process happen, if anything goes wrong you will often see an error in the output. If everything works then your app will now be live on the internet.

Heroku provides a Postgresql database for every web application, but we need to add our tables to the database they provide. We do this with the same command `rake db:migrate`, but we need to do it on their servers, luckily Heroku provides a command to easily run commands on their servers:

```sh
heroku run rake db:migrate
```

Now, you app should be up and running.

Navigate to "http://YOURAPPNAME.herokuapp.com" where YOURAPPNAME is the name you gave to heroku, `cool-app-name` in my case, so the full url is `http://cool-app-name.herokuapp.com`.
