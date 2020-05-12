require 'awesome_print'

module Jekyll
  @@globals = {}
  def self.globals
    @@globals
  end
  def globals
    @@globals
  end

  class GlobalVariableSetTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    def render(context)
      if (parts = @text.split(/\=/)).count.eql? 2
        Jekyll.globals[parts.first.strip] = parts.last.strip
      end
      nil
    end
  end

  class GlobalVariableGetTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    def render(context)
      Jekyll.globals[@text]
    end
  end

end

Liquid::Template.register_tag('set_global_variable',
  Jekyll::GlobalVariableSetTag)
Liquid::Template.register_tag('get_global_variable',
  Jekyll::GlobalVariableGetTag)
