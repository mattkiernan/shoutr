module ApplicationHelper
  def bold(text)
    # text.gsub(/@\w+/) do |username|
    #   content_tag :strong, usernam
    # end

    username = /@\w+/.match(text)
    boldname = content_tag(:strong, username)
    text.gsub(/@\w+/, boldname)
  end
end
