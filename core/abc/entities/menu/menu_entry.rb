module Abc
  # A MenuEntry is the class that actually holds entries to the {Menu} class.
  # This is the parent type of the subtypes that can be registered
  # ({Menuable}s). Note that these do not define entry points; those are done
  # by {Path}s, though you shouldn't have to ever see a Path unless you define
  # an additional one for a {Viewable}. If you have defined an additional path,
  # then the interface should let you specify which you want to use for the
  # menu entry.
  class MenuEntry
    attr_accessor :title, :children

    def initialize(title, children)
      self.title = title
      self.children = children.map do |child|
        self.class.new(child[:title], child[:children])
      end if children
    end

  end
end
