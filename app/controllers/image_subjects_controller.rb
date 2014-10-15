class ImageSubjectsController < ApplicationController

  def create
    image_subject = ImageSubject.new(image_subject_params)
    if image_subject.save
      current_user.shouts.create(subject: image_subject)
      redirect_to shouts_path
    end
  end

  def image_subject_params
    params.require(:image_subject).permit(:url)
  end
end
