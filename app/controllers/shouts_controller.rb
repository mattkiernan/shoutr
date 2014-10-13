class ShoutsController < ApplicationController

  before_action :require_login

  def index
    @shouts = Shout.all
    @shout = Shout.new
    @users = User.all
    @following_relationships = FollowingRelationship.new
    @users_i_follow = current_user.followed_users 
    @users_i_do_not_follow = User.where.not(id: current_user.followed_users)
  end

  def create
    shout = current_user.shouts.new(shout_params)
    if shout.save
      redirect_to shouts_path
    else
      @shout = Shout.new
      @shouts = Shout.all
      render :index 
    end
  end

  def shout_params
    params.require(:shout).permit(:body)
  end

end
