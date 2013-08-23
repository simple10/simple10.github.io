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

require_relative 'date'

module Jekyll
  class Callout < Liquid::Block
    include Octopress::Date

    def render(context)
      content = convert_markdown(super, context)
      title = render_title(context)
      "<aside class='callout'>#{title}#{content}</aside>"
    end

    def convert_markdown(content, context)
      context.environments.first['page']
      @converter ||= context.registers[:site].converters.find {|c|
        c.is_a? Jekyll::Converters::Markdown
      }
      @converter && @converter.convert(content) || content
    end

    def render_title(context)
      return '' if @markup.empty?
      date_format = context.registers[:site].config['date_format']
      title = convert_date(@markup, date_format)
      "<header><span>#{title}</span></header>"
    end

    def convert_date(content, format)
      content.gsub(/date:([^\s]+)/) {|s|
        date = format_date($1, format)
        "<span class='date'>#{date}</span>"
      }
    end
  end
end

Liquid::Template.register_tag('callout', Jekyll::Callout)
