module BoldHelper
  def bold(username)
    content_tag(:strong, username)
  end
end
