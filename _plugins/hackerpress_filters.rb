module HackerpressFilters
  # tags can be site.categories or site.tags
  def sort_tags_by_length(tags, dir = 'desc')
    sorted = Array(tags).sort {|a, b|
      b[1].length <=> a[1].length
    }
    sorted.reverse! if dir == 'asc'
    sorted
  end
end

Liquid::Template.register_filter HackerpressFilters
