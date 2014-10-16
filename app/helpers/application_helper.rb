module ApplicationHelper
  def link(text)
     text.gsub(/@(\w+)/) do |mention|
       username = mention[1..-1]
       link_to mention, user_path(username)
     end
  end
end
