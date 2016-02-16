# Testing Django

### Getting Started

```sh
pip install twython
pip install mock
```

Create a `Tweet` class that will handle the wrapper for our tweet searches:

```sh
touch cityscape/tweet.py
```

Next we'll open up the `cityscape/tests.py` file and do some initial setup:

```py
from django.test import TestCase
from unittest.mock import MagicMock
from website.tweet import Tweet

class TweetMethodTests(TestCase):

    def test_search_returns_a_list_of_tweets(self):
      self.assertEqual(true, true)

```

Next we can implement our real test:

```py
from django.test import TestCase
from unittest.mock import MagicMock
from website.tweet import Tweet

class TweetMethodTests(TestCase):

    def test_search_returns_a_list_of_tweets(self):
        fake_twitter_response = {"statuses": [{"text": "Blah"}]}
        client = Tweet.client
        client.search = MagicMock(return_value=fake_twitter_response)
        self.assertEqual(Tweet.search("Blah")["statuses"][0]['text'], "Blah")
        client.search.assert_called_with(q="Blah")
```

And an example of testing a View

```py
from django.test import TestCase
from django.test import Client
from django.core.urlresolvers import reverse
from unittest.mock import MagicMock
from website.tweet import Tweet

class TweetMethodTests(TestCase):

    def test_search_returns_a_list_of_tweets(self):
        fake_twitter_response = {"statuses": [{"text": "Blah"}]}
        client = Tweet.client
        client.search = MagicMock(return_value=fake_twitter_response)
        self.assertEqual(Tweet.search("Blah")["statuses"][0]['text'], "Blah")
        client.search.assert_called_with(q="Blah")

class WebsiteViewTest(TestCase):

    def test_index_return_200(self):
        client = Client()
        response = client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
```
