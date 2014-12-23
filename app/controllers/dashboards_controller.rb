class DashboardsController < ApplicationController
  def show
    @users = User.all
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @timeline = current_user.timeline.page(params[:page]).per(2)
  end
end
