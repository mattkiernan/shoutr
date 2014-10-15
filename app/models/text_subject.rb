class TextSubject < ActiveRecord::Base
  belongs_to :shout

  validates :body, presence: true

  def body=(new_body)
    self[:body] = new_body.upcase
  end
end
