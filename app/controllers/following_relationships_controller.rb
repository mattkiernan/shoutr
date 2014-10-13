class FollowingRelationshipsController < ApplicationController

  def create
    user_to_follow = User.find(params[:user_id])
    current_user.followed_users << user_to_follow
    redirect_to root_path
  end

end
