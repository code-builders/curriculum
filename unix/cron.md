# Cron

Cron is a UNIX time-based task runner. Your computer uses cron to do common repeatable tasks such as deleting temporary files or updating software on a schedule.

We can use cron to execute any Ruby (python, javascript, etc...) on a schedule. There is a special tool to add/remove cron tasks from your system:

```sh
crontab -e
# This will open vim, remember `:w` is save `:q` is quit, `:wq` is save and quit.
```

Modifying this special file will automatically update your systems cron.

### Syntax

Cron is given in a pretty wacky (but pretty easy) syntax, in the file a single line is an entry for a single task to run. The line starts with five `*` followed by the command to run:

```sh
* * * * * ruby /Users/Bookis/code-builders/curriculum/playground/cron_test.rb
```

To break this down the five `*` characters represent time-slots, in order these stars represent:

1. Minutes `0-59`
1. Hours `0-23`
1. Date `1-31`
1. Month `1-12`
1. Weekday `0-6`

So we can replace any of these stars to specify a wide range of date and times, for example, every Wednesday at 5:05pm would be:

```sh
5 17 * * 3
# 5th minute
# 17th Hour (5pm)
# 3rd day of the week (wednesday)
```

Note the `*` means any value, so `* * * * *` would actually mean that the task should run at every minute of every hour.

The command after the time settings can be a wide variety of things including a Ruby (or python) script.

```sh
* * * * * ruby /Users/Bookis/code-builders/curriculum/playground/cron_test.rb
```

This will run the ruby script `cron_test.rb` every minute. We have to give the full path to our file because cron is not running from our current terminal session so it can't assume "where we are".

There are some other neat syntax and information about cron, I find [crontab.guru](http://crontab.guru) very helpful. Let's jump over there to play with some common settings.
