# ABC - Afterburner CMS
------

[![Code Climate](https://codeclimate.com/github/grounded/afterburnercms.png)](https://codeclimate.com/github/grounded/afterburnercms)

## We make building sites as easy as 1-2-3.

### 1. Install the gem.

Fetch it directly from Github:

```ruby
gem 'abc', github: 'grounded/afterburnercms'
```

### 2. ???

TODO: Fill this in

### 3. Profit!

![Please!](http://i2.kym-cdn.com/photos/images/newsfeed/000/264/200/acb.jpg)

## Using it with Rails
You need to mount both the backend (administrative section) and the frontend (user-facing section) in your rails app.  This can be accomplished by adding the following to your `config/routes.rb`:

```ruby
mount Abc::Backend::Engine  => '/admin'
mount Abc::Frontend::Engine => '/'
```

*NOTE:* Do not use the `:as` option when mounting the Afterburner engines.  This will yield unfavorable results / all manner of brokenness.


## Development
To run the tests inside a subproject (i.e. `/core`):

```shell
bundle
bundle exec rspec spec
```

To run all tests:

```shell
script/rspec
```

To bundle install for all the projects:
```shell
script/bundle
```

To run some command in all sub-projects:
```shell
script/run somecommand
```

To list out the sub-projects:
```shell
script/projects
```
