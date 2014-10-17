class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(shout_id: params[:shout_id])
    redirect_to shouts_path
  end

  def destroy
    shout = Shout.find(params[:shout_id])
    favorite = current_user.favorites.where(shout_id:shout.id)
    current_user.favorites.destroy(favorite)
    redirect_to shouts_path
  end
end
