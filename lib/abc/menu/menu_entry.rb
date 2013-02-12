module ABC
  # A MenuEntry is the class that actually holds entries to the {Menu} class.
  # This is potentially one of many subtypes that can be registered
  # ({Menuables}). Note that these do not define entry points; those are done
  # by {Path}s, though you shouldn't have to ever see a Path unless you define
  # an additional one for a {Viewable}. If you have defined an additional path,
  # then the interface should let you specify which you want to use for the
  # menu entry.
  class MenuEntry
  end
end
