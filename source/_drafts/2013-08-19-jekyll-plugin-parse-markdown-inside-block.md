For hackerpress, I wanted to have some nice syntactic sugar for callouts.

Creating a new Liquid block tag was the obvious solution but Liquid does not
run converters on content inside of a tag. You can next blocks and tags inside
each other just fine, but you have to jump through some hoops if you want
markdown or other text converted into HTML.


```liquid This works fine
{% callout %}
  Something important to say here.
{% endcallout %}
```

```liquid And this works fine as well
{% callout %}
  Something important to say here.
  {% blockquote %}
    Some nested tag stuff here.
  {% endblockquote %}
{% endcallout %}
```

```liquid This does not work
{% callout %}
**Some** [markdown](http://daringfireball.net/projects/markdown/) stuff here.
{% endcallout %}
```

In order to get the markdown converted, you have to manually call the converter
inside of your custom callout plugin.

```ruby
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
```

It seems pretty janky to poke around in the context object to get the
markdown converter, but it works just fine and is unlikely to break anytime
soon.

The other option instead of using Liquid tags was to use kramdown's ability to
add HTML attributes like CSS classes to blocks.

```markdown
> A simple blockquote with class="callout"
{: .callout}
```

But this syntax is too specific to kramdown and a bit strange looking to my eye.
