class ShoutsController < ApplicationController

  before_action :require_login

  def index
    @shouts = Shout.all
    @shout = Shout.new
  end

  def create
    shout = current_user.shouts.new(shout_params)
    if shout.save
      redirect_to shouts_path
    else
      render :new
    end
  end

  def shout_params
    params.require(:shout).permit(:body)
  end

end
