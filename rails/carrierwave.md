CarrierWave and S3
------------------
CarrierWave is a gem that adds a fairly simple and flexible way to users to upload files to our Rails application. It also lets us resize images to make thumbnails and other sizes as we need them, and lets us upload all these uploaded (and generated) files to cloud storage products, such as S3.

## How-to
### Make an S3 bucket

S3 -- Simple Storage Service "buckets" are like folders but on a remote file system. You can store files in these buckets to access using HTTP. This idea is basically Dropbox for developers.

[Sign in / up to Amazon AWS](http://console.aws.amazon.com), then click on "S3" (It's like 5th from the top). Click "Create Bucket", give the bucket a unique name for this project, every project with image uploads will have it's own bucket. Select the region "Oregon" (the code name for this region is "us-west-2", we'll see that later). Click "Create".

---------


Let's start with installing the tool to manipulate images:


```sh
brew update
brew install imagemagick
```

Next make a new Rails app

```bash
$ rails new band_practice -T -d postgresql
$ cd band_practice
$ rails g scaffold band name genre
$ rake db:create db:migrate
```

### Setup Carrierwave and Fog Gems

Fog is a gem that helps us work with *cloud services* like those from Amazon - EC2 or S3 - as well as cloud offerings from other companies (like Microsoft, Rackspace, Blue Box, etc).

```ruby
gem "carrierwave", "~> 0.10.0"
gem 'fog'
gem 'dotenv-rails'
gem 'mini_magick'
```

### Add an Uploader
Now you need a uploader. This is the file which has all the settings like which folder the image will be saved, setting the image quality, caching etc.

```bash
$ bundle exec rails g uploader ImageFile
```

The generator creates a new directory called `uploaders` under the `app` directory and in it a file called `image_file_uploader.rb`. In this file are a number of comments explaining how to customize the uploader. For example there is code to change the upload location, perform processing on the image after uploading and to restrict the type of files that can be uploaded. You should take a look at these options on your own, but for demonstration purposes we're going to get rid of most of it in favor of this:

```ruby
class ImageFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fit => [256, 256]
  end

  version :square do
    process :resize_to_fill => [256, 256]
  end

end
```

Next we'll need to add the uploader to the `Band` model. We'll need a column in the bands table to store it in so we'll generate a migration to do add it.

```bash
 $ rails g migration add_image_to_bands image_file:string
 $ rake db:migrate
```

Then, we *mount* the uploader on the `Band` model.

```ruby
class Band < ActiveRecord::Base
  mount_uploader :image_file, ImageFileUploader
end
```

Add a `file_field` to the Band form.

app/views/bands/_form.html.erb
```ruby
<div class="field">
  <%= f.label :image_file %><br>
  <%= f.file_field :image_file %>
</div>
```


We add `:image_file` to the strong params for the controller.

app/controllers/bands_controller.rb
```ruby
def band_params
  params.require(:band).permit(:name, :genre, :image_file)
end
```

Finally, we modify the scaffolded form and show pages to include a form element for the image upload, and modify the `form_for` to add an `:html` option.

apps/views/bands/show.html.erb
```ruby
<p>
  <%= image_tag @band.image_file.url %>
</p>
```

Now we can upload images - yay! In your terminal, take a look at `public/uploads` - `mini_magick` and `carrierwave` made all those files for us! We have access to these different sizes by passing the symbol of the size (as defined in our uploader model) to `#image_file.url`

app/views/bands/show.html.erb
```ruby
<p>
  <%= image_tag @band.image_file.url(:thumb) %>
</p>
```


## Uploading to S3

This is cool, but we want to save to S3 instead of the local file system. This is pretty easy. First, we need to tell CarrierWave that we want to use S3. Make a new initializer, `config/initializers/carrierwave.rb`

```sh
touch config/initializers/carrierwave.rb
```

```ruby
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider:              'AWS',     
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region:                'us-west-2'
  }
  config.fog_directory  = ENV["AWS_BUCKET"]
end
```

We also need to fill out our `.env` file. We can get the secret information from the **IAM** section in the AWS dashboard

1. Go to AWS
2. Select **IAM** from the **Services** menu.
3. Click **Users** in the left column
4. Click "Create New Users" at the top of the page
5. Give a username for this specific application
6. Click **Show User Security Credentials** *or* **Download Credentials** <small>(Note: You must store these credentials somewhere yourself, AWS will never allow you to see them agin.)</small>
7. Click "Close".
8. Next, click on the username that you just created from the table of users
9. Under the **Permissions** tab, click **Attach Policy**
10. In the **Filter** input, type **S3**
11. Check the box for **AmazonS3FullAccess**
12. Click **Attach Policy**

Whew... Ok, next we'll put the security credentials into our application. We cannot commit these credentials into git, it's disastrous. To get around this issue we use a gem called `dotenv-rails`. It will allow us to read secret values from a file without commiting that file. The file will be called `.env` in the root of our rails app. Before we create that file let's make sure that it will never be commited by adding it to out `.gitignore`.

```sh
atom .gitignore
```

```sh
# In .gitignore
.env # Add this anywhere in the file
```

Next we'll create the file and add our secret keys to it.

```
touch .env
atom .env
```

```sh
# In .env
AWS_ACCESS_KEY_ID: # YOUR_ID_HERE
AWS_SECRET_ACCESS_KEY: # YOUR_KEY_HERE
AWS_BUCKET: # YOUR_BUCKET_NAME_HERE
```

And now if we try to upload, everything should work.

## Resources

[Railscasts #253 CarrierWave File Uploads](http://railscasts.com/episodes/253-carrierwave-file-uploads?view=asciicast)

[Railscasts #383 Uploading to Amazon S3](http://railscasts.com/episodes/383-uploading-to-amazon-s3?view=asciicast)

[Allowing File Uploads with CarrierWave](http://richonrails.com/articles/allowing-file-uploads-with-carrierwave)

[Saving files in Amazon S3 using Carrierwave and Fog Gem](http://www.javahabit.com/2012/06/03/saving-files-in-amazon-s3-using-carrierwave-and-fog-gem/)
