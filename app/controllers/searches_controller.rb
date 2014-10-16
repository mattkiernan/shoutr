class SearchesController < ApplicationController

  def show 
    query = params[:query]
    user_results = User.where("email ILIKE ?", "%#{query}%")
    text_results = TextSubject.where("body ILIKE ?", "%#{query}%")
    url_results = ImageSubject.where("url ILIKE ?", "%#{query}%")
    text_shouts_results = text_results.map{|result| result.shout}
    image_shouts_results = url_results.map{|result| result.shout}
    @results = user_results + text_shouts_results + image_shouts_results

  end
end
