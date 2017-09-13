module WikiHelper
  def list(wiki_page)
    wiki_page.each do |user|
      if user.user_id == nil
       "Unknown"
      else
        User.find(user.user_id).email
      end
    end
  end
end
