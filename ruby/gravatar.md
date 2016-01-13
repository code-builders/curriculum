# Gravatar

Gravatar is a service for standardized profile photos using email addresses.

The idea is that you form a link using an email address, if the user has signed up for gravatar their photo will be returned from that link. Here is a mock link:

```rb
"http://www.gravatar.com/avatar/bookis.worthy@gmail.com.jpg"
# This returns a photo of me
```

But... it's not quite that simple, to avoid the email address actually being in the URL, the email address is first hashed (the same as our passwords for password_digest).

```rb
email = "bookis.worthy@gmail.com"
hashed_email = Digest::MD5.hexdigest(email.downcase) # be sure to downcase, also any extra white space needs to be removed
# => "8901bf5b3750f320c8dd91c64c7be309"

image_url = "http://www.gravatar.com/avatar/#{hashed_email}.jpg"
```

This would be a great method to put in a helper.

```rb
module ApplicationHelper
  def gravatar_for(email)
    hashed_email = Digest::MD5.hexdigest(email.downcase)

    image_tag "http://www.gravatar.com/avatar/#{hashed_email}.jpg", alt: "Profile Photo"
  end
end
```
