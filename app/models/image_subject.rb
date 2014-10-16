class ImageSubject < ActiveRecord::Base
  has_one :shout, as: :subject
end
