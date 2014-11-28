class DirectShoutsController < ApplicationController

  def show
    name = "@" + current_user.username
    @direct_shouts = []
    shouts = Shout.all
    shouts.each do |shout|
      if shout.subject.body.include?(name) 
        @direct_shouts << shout 
      end
    end
  end

end
