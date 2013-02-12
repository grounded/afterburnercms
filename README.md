# ABC — Afterburner CMS
------

## We make building sites as easy as 1-2-3.

### 1. Install the gem.

Grab it off of rubygems with:

```ruby
gem install abc
```

Add it to an existing Rails project:

```ruby
gem 'abc'
```

Or fetch it directly from Github:

```ruby
gem 'abc', :git => 'git://github.com/afterburnercms/afterburnercms.com'
```

### 2. ???

TODO: Fill this in

### 3. Profit!

![Please!](http://i2.kym-cdn.com/photos/images/newsfeed/000/264/200/acb.jpg)


## Development Stuff

### Contributing

- Please open a pull request for your code change, no matter how small the change. As irritating as that is, someone should be around to commit it at almost all hours of the day, so you shouldn't be delayed that long.
- Please keep the master branch deployable at all times. New features in branches.
- Rebase where possible—don't merge.
- Name your branches descriptively, and delete them when they're merged in.

### Documentation

All code should be thoroughly documented using Markdown with YARD tags. You can run the YARD server and have it reload while you work so you can preview your changes:

```shell
yard server --reload
```

Then tune in to `locahost:8808` to see what's going on.
