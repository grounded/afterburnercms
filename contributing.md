# Contribution Guidelines #

Thank you for your interest! There are a few ways you can help make this project better!

## Submitting a new issue ##

If you want to ensure that your issue gets fixed *fast* you should
attempt to reproduce the issue in an isolated example application that
you can share.

## Making a pull request ##

If you'd like to submit a pull request please adhere to the following:

1. Your code *must* be tested. Please TDD your code!
2. No single-character variables
3. Two-spaces instead of tabs
4. Single-quotes instead of double-quotes unless you are using string
   interpolation or escapes.
5. General Rails/Ruby naming conventions for files and classes
6. *Do not* use Ruby 1.9 stubby proc syntax

Plase note that you must adhere to each of the above mentioned rules.
Failure to do so will result in an immediate closing of the pull
request. If you update and rebase the pull request to follow the
guidelines your pull request will be re-opened and considered for
inclusion.

## Chief Contributors

- Josh Adams ([knewter](https://github.com/knewter/) / IRC: jadams)
- Philip Arndt ([parndt](https://github.com/parndt/) / IRC: parndt)
- Ryan Bigg ([Radar](https://github.com/radar/) / IRC: Radar)
- Johan Bruning ([JohanB](https://github.com/johanb/) / IRC: gidogeek)
- Garrett Heinlen ([GoGoGarrett](https://github.com/gogogarrett/) / IRC: GoGoGarrett)
- Andrew Hooker ([GeekOnCoffee](https://github.com/geekoncoffee/) / IRC: GeekOnCoffee)
- Uģis Ozols ([ugisozols](https://github.com/ugisozols/) / IRC: ugisozols)
- Rob Yurkowski ([robyurkowski](https://github.com/robyurkowski/) / IRC: robyurkowski)

And with much thanks to the following people:

- Wiljo Rouwenhorst (logos, design)

## Learn & listen

* IRC channel: irc.freenode.net #afterburner

## Adding new features

- Please open a pull request for your code change, no matter how small the change. As irritating as that is, someone should be around to commit it at almost all hours of the day, so you shouldn't be delayed that long.
- Please keep the master branch deployable at all times. New features in branches. Bugfixes in branches.
- Rebase where possible--don't merge.
- Name your branches descriptively, and delete them when they're merged in.

### Documentation

All code should be thoroughly documented using Markdown with YARD tags. You can run the YARD server and have it reload while you work so you can preview your changes:

```shell
yard server --reload
```

Then tune in to `locahost:8808` to see what's going on.

Don’t get discouraged! We estimate that the response time from the
maintainers is around: NaN
