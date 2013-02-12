module ABC
  # Path is an object that represents a valid entry point to a viewable. This
  # is a mostly invisible object that's created when you set a custom URL on a
  # {MenuEntry}, but this makes it possible to also add custom, non-canonical
  # entry points to {Viewable}s.
  #
  # This will be particularly valuable for a number of reasons:
  #
  # 1. Custom URLs, obviously;
  # 2. Entry points with additional options: you could specify an additional
  # route that would pass along information to the {Viewable} or its renderer,
  # such as whether comments should be displayed. A trivial example would be a
  # Path that's used in a BlogPost-style {MenuEntry} that shows comments or not
  # (i.e. /blog/post/blah/no-comments).
  class Path
  end
end
