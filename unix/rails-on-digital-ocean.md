- Sign in to https://www.digitalocean.com
- Click "Create Droplet"
  - Under "Choose an Image" Select "Ubuntu"
  - Under "Choose a size" select "$5/mo"
  - Under "Choose a datacenter region" choose "San Francisco"
  - Click "New SSH Key"
    - Go to the Terminal and type `cat ~/.ssh/id_rsa.pub`
    - Copy/Paste the output into the form in Digital Ocean
    - Click "Add SSH Key"
  - Under "Choose a hostname" enter a name for your server like "code-builders-test"

Digital ocean will now spin up this server, which can take about a minute. After it's complete click on the name of the Droplet. Directly under the droplet name you will see an ip address. Copy this ip address. Go to your Terminal

```sh
ssh root@DROPLET.IP.ADDRESS.HERE # <-- The ip address you just copied
```
You will asked about "authenticity of host", say yes.

Now the prompt of your Terminal should have changed to something like:

```sh
root@code-builders-curry:~# |
```

You are now SSH'd (Secure Shell), this is an encrypted connection to a remote server via the shell. So now what you are typing into this Terminal window is actually being typed into a computer in San Francisco. Say What!

The file structure, tools, and content are all completely different from your computer. This computer has a fresh install of Ubuntu and that's it. It's a super minimal computer ready to be upgraded to do whatever you need to do.

The first thing we are going to do is create a new "User", just like on OS X, you can have multiple users on Ubuntu, we are currently a user called `root`, essentially `root` is the default user that can do anything, which can be a bad thing, root can accidentally delete the entire file system. Typically it's best to setup a user that has fewer privileges.

To add a user:
```sh
adduser USERNAME # <-- any name here
```

You will be asked a few questions, the only one that you must fill in is the password, make it a good one. The rest you can leave blank.

Next you want to make it so that the new user does have the ability to do whatever they want, but only if they type `sudo` first, this makes it so that anything destructive has to be done more intentionally.

```sh
gpasswd -a USERNAME sudo # <-- your username instead of USERNAME
```

Next we need to add our SSH key to this new user, in a local terminal window run `cat ~/.ssh/id_rsa.pub` and copy the result again, then in the remote terminal tab:

```sh
su - USERNAME  # switches to USERNAME
mkdir .ssh
sudo chmod 700 .ssh
sudo vim .ssh/authorized_keys
```

Enter insert mode, paste in the result from `cat ~/.ssh/id_rsa.pub` in your local tab. Save and quit.

```sh
sudo chmod 600 .ssh/authorized_keys
exit # switches back to root
```

Now one last thing before we logout then back in as our new user, we want to disable logging in as `root` just to make sure there are no mistakes:

```sh
vim /etc/ssh/sshd_config
```

Find `PermitRootLogin yes` and change it to `PermitRootLogin no`. Save and quit.

Now restart ssh and exit:

```sh
service ssh restart
exit
```

Now we can SSH in as our new user:

```sh
ssh USERNAME@DROPLET.IP.ADDRESS.HERE
```

On your computer, OS X comes with a ton development tools pre-installed, most things that were not already installed we installed on day 1. We used a tool called `brew` to install new tools

We have to do the same thing for this new server, but instead of `brew` we'll use a tool called `apt-get`, we're going to install dozens of things, but many things can be installed in a single command so it should be pretty painless:

```sh
sudo apt-get update

# This command will ask if ok to take up space, say Yes
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

sudo apt-get install -y build-essential bison ruby-dev rake zlib1g-dev \
    libyaml-dev libssl-dev libreadline-dev libncurses5-dev llvm llvm-dev \
    libeditline-dev libedit-dev

sudo apt-get install postgresql postgresql-contrib libpq-dev

```

So, we've just installed tons of stuff. Next we're going to install the current version of Ruby:

```sh
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars

echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

rbenv install -l # <- This will list all available versions of ruby, find the highest version number which isn't prepended with anything. i.e. not `rbx-3.19`, just `2.3.0`

rbenv install 2.3.0 # <- This one takes like 10 minutes.
rbenv global 2.3.0


rbenv rehash
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install rails
rails -v

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get install nodejs
```

Next we need to setup Postgresql:

```sh
sudo -u postgres createuser -s USERNAME
```
That was easy. Next we'll prepare our server to allow git to push to it.

```sh
cd ~
mkdir repo && cd repo
mkdir site.git && cd site.git
git init --bare

cd hooks
vim post-receive
```

Now in vim add:
```sh
#!/bin/sh
git --work-tree=/home/USERNAME/app --git-dir=/home/USERNAME/repo/site.git checkout -f
```

Then:
```sh
chmod +x post-receive
```

Now we have a empty git repo at `~/app/` that we can push a rails app to. On your local machine run the following to add this server as a remote:

```sh
git remote add production ssh://USERNAME@IP.ADDRESS/home/USERNAME/repo/site.git
```

Then we can push with:

```sh
git push production master
```


```sh
cd ~/app
bundle install
vim .rbenv-vars
```

```sh
RAILS_ENV=production
SECRET_KEY_BASE=somesecretkeyhere-run-rake-secret-to-get-one
```

Next on your local machine, edit the `config/database.yml` to use the database username from your remote server in the production section (near the bottom)

```yml
production:
  <<: *default
  database: recap_test_production
  username: USERNAME
```

Then add, commit, and push again.

Next on your remote server, create the database and start the server:


```sh
createdb recap_test_production
rails server --binding=IP.ADDRESS
```

Now in the browser type in your `IP.ADDRESS:3000` and you should see your webpage.

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04
https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04
