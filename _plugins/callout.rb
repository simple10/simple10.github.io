#
# Author: Joe Johnston
#
# Outputs a callout box useful for drawing attention to the contents.
# Converts markdown inside of the callout to HTML.
#
#   {% callout
#   Look at me!
#   {% endcallout %}
#   ...
#   <aside class="callout">
#     <p>Look at me!</p>
#   </aside>
#

module Jekyll
  class Callout < Liquid::Block
    def render(context)
      content = convert_markdown(super, context)
      "<aside class='callout'><p>#{content}</p></aside>"
    end

    def convert_markdown(content, context)
      context.environments.first['page']
      @converter ||= context.registers[:site].converters.find {|c|
        c.is_a? Jekyll::Converters::Markdown
      }
      @converter && @converter.convert(content) || content
    end
  end
end

Liquid::Template.register_tag('callout', Jekyll::Callout)
