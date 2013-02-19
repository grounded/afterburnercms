# Apparently I need this because autoloading? ActiveSupport::Concern fails to load otherwise.
require 'action_view'
require 'active_support/core_ext/string'
# require 'action_view/helpers/tag_helper'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # But it only knows how to spit out root nodes; it trusts that nodes know how
  # to render themselves.
  #
  # TODO: Should it hold the logic for appending items to its tree, or should
  #       it just be able to construct itself from arguments?
  #       Are there caching benefits?
  class Menu
  end
end
