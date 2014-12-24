class DashboardsController < ApplicationController
  before_action :require_login
  def show
    @users = current_user.not_followed_users.last(4)
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @timeline = current_user.timeline.page(params[:page]).per(6)
  end
end
