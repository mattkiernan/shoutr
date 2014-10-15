class TextSubject < ActiveRecord::Base
  belongs_to :shout

  validates :body, presence: true
end
