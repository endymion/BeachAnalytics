require 'awesome_print'

module Jekyll

  class OverridableLinkTag < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @variable_name = text.strip
    end
    def render(context)
      text = super
      href_override = Jekyll.globals[@variable_name]
      unless href_override.blank?
        return href_override
        Jekyll.globals[@variable_name] = nil
      else
        return text
      end
    end
  end

end

Liquid::Template.register_tag('overridable_link',
  Jekyll::OverridableLinkTag)
