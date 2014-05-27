
atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @articles.each do |item|
    next if item.updated_at.blank?
    
    feed.entry(item, url:"/article/show/"+item.id.to_s) do |entry|
      entry.title item.headling
      entry.content item.body[0..250]+"..." , :type => 'html' unless item.body.blank?
      
      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        author.name get_name(item.user) unless item.user.blank?
      end
      
    end
  end
end
