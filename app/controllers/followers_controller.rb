class FollowersController < ApplicationController

  def index
    @followed_users = current_user.followers
  end
end
