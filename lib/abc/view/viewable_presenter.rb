module Abc
  # This is a superclass that's used to define some sensible defaults and
  # provide additional methods to presenters, which are used to determine how
  # to present a {Viewable} for a specific medium. Without reference to the
  # medium, these are just HTML presenters... but we could have something like
  # a JsonPagePresenter, too.
  class ViewablePresenter
  end
end
