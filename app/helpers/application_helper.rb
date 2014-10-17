module ApplicationHelper
  def link(text)
     text.gsub(/@(\w+)/) do |mention|
       username = mention[1..-1]
       all_users = User.all
       all_usernames = all_users.map{|user| user.username}
       if all_usernames.include?(username)
         link_to mention, user_path(username)
       else
         mention
       end
     end
  end

  def hashtag(text)
    text.gsub(/#(\w+)/) do |hash|
      hashtag = hash[1..-1]
      link_to hash, controller: "searches", query: hashtag, action: "show"
    end
  end
end
