class DirectShoutsController < ApplicationController

  def show
    name = "@" + current_user.username
    @direct_shouts = []
    subjects = TextSubject.all
    subjects.each do |subject|
      if subject.body.include?(name)
        @direct_shouts << shout
      end
    end
  end

end
