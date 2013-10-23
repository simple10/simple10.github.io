Defining a class constant will ensure a view partial is not accidentally 
included twice per request. This allows for any view 

```haml
- unless defined?(@GOOGLE_MAPS_JS_INCLUDED) && @GOOGLE_MAPS_JS_INCLUDED
  - @GOOGLE_MAPS_JS_INCLUDED = true
  = javascript_include_tag '//maps.google.com/maps/api/js?v=3.13&sensor=false&libraries=geometry'
```

Using a helper.

```ruby
module ApplicationHelper
  def render_once(view, *args, &block)
    @_render_once ||= {}
    if @_render_once[view]
      nil
    else
      @_render_once[view] = true
      render(view, *args, &block)
    end
  end
end
```

Now use render_once in views.

```haml
# _some_view.html.haml
require_once 'layouts/google_maps_js'

# _some_other_view.html.haml
require_once 'layouts/google_maps_js'
```

When both partials are rendered in a view, the google_maps_js partial will 
only be rendered once.

