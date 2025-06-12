Jekyll::Hooks.register :site, :post_read do |site|
  notes_data = site.data['notes']
  
  notes_data.each do |note|
    slug = Jekyll::Utils.slugify(note['topic'])
    
    note_page = Jekyll::Page.new(site, site.source, 'notes', "#{slug}.html")
    note_page.data['layout'] = 'note'
    note_page.data['title'] = note['topic']
    note_page.data['topic'] = note['topic']
    note_page.data['date'] = note['date']
    note_page.data['tags'] = note['tags']
    note_page.data['permalink'] = "/notes/#{slug}/"
    note_page.content = note['content']
    
    site.pages << note_page
  end
end
