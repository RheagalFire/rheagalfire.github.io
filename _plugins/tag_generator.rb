Jekyll::Hooks.register :site, :post_read do |site|
  notes_data = site.data['notes']
  all_tags = []
  
  notes_data.each do |note|
    all_tags.concat(note['tags'])
  end
  all_tags.uniq!
  
  all_tags.each do |tag|
    tag_slug = Jekyll::Utils.slugify(tag)
    
    tag_page = Jekyll::Page.new(site, site.source, 'tags', "#{tag_slug}.html")
    tag_page.data['layout'] = 'tag'
    tag_page.data['title'] = "Tag: ##{tag}"
    tag_page.data['tag'] = tag
    tag_page.data['permalink'] = "/tags/#{tag_slug}/"
    
    site.pages << tag_page
  end
end
