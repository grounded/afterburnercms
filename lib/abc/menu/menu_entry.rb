require 'action_view'
require 'active_model'

module Abc
  # A MenuEntry is the class that actually holds entries to the {Menu} class.
  # This is the parent type of the subtypes that can be registered
  # ({Menuable}s). Note that these do not define entry points; those are done
  # by {Path}s, though you shouldn't have to ever see a Path unless you define
  # an additional one for a {Viewable}. If you have defined an additional path,
  # then the interface should let you specify which you want to use for the
  # menu entry.
  class MenuEntry
    include ActiveModel::Model
    include ActionView::Helpers::TagHelper
    include ActionView::Context # Nested content_tags

    attr_accessor :title, :list_element_pair

    def initialize(attributes = {})
      super
      self.list_element_pair ||= [:ul, :li]
    end

    # Renders a menu item in HTML format, and, if it has children, renders those too.
    # 
    # **A note on HTML safety:**
    #
    # It is up to each menu item to check that it is rendering itself safely.
    # By default, most of the menu has to be declared safe, or else its
    # constituent tags won't render properly. So we declare vast swaths of the
    # menu HTML safe, and in truth these parts are. The parts that
    # need to be especially watched are any spots where you render user input.
    # By design, that surface is constrained to the `render_as_html` method.
    # You must, however, return a string marked with html_safe from that method
    # or else the menu will raise `ActiveSupport::SafeBuffer::SafeConcatError`.
    # 
    # (This doesn't meant that the entire string must be unsanitized; just that
    # you must make assurances that your content is appropriately escaped. By
    # default, ABC uses `ERB::Util#h` to sanitize the user-interpreted parts, but
    # your derivative classes may have to implement this on their own.)
    #
    # @return [SafeBuffer] A safe string containing the MenuEntry and its children.
    def to_html
      raise ActiveSupport::SafeBuffer::SafeConcatError unless (content = self.render_as_html).html_safe?

      content_tag self.list_element_pair.last do
        # TODO: Once relationship is cemented, remove this first check.
        # - RY 21/02/13
        if self.respond_to?(:children) && self.children.present?
          self.render_with_children_as_html(content)
        else
          content
        end
      end.html_safe
    end

    protected 
    # Renders this menu item and its children with the assumption it has children.
    #
    # @param content [SafeBuffer] A safe string to use as the content of this, the parent {MenuEntry.
    # @return [SafeBuffer] A safe string to be rendered by the parent {Menu} or {MenuEntry}.
    def render_with_children_as_html(content)
      content.safe_concat(content_tag(self.list_element_pair.first) do
        self.children.reduce(::ActiveSupport::SafeBuffer.new) do |buffer, child|
          child.list_element_pair = self.list_element_pair
          buffer.safe_concat child.to_html
        end
      end.html_safe)
    end

    # Render this {MenuItem} without children.
    #
    # **NB**: ERB::Util#h will mark a string as safe.
    #
    # @returns [SafeBuffer] A safe string to be rendered or appended with children.
    def render_as_html
      buffer = self.title
      ERB::Util.h(buffer)
    end
  end
end
