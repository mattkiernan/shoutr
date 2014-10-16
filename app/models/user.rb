class User < ActiveRecord::Base

  has_many :shouts, dependent: :destroy

  has_many :following_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users, through: :following_user_relationships

  has_many :follower_user_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"

  has_many :followers, through: :follower_user_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, uniqueness: true

  def follow(other_user)
    followed_users << other_user
  end

  def unfollow(other_user)

  end

  def following?(other_user)
    followed_users.include?(other_user)
  end

  def unfollow(user_to_unfollow)
    followed_users.destroy(user_to_unfollow)
  end

  def timeline
    timeline_users = followed_user_ids + [id]
    Shout.where(user_id: timeline_users).order('created_at desc').limit(20)
  end

  def body=(new_body)
   self[:body] = new_body.upcase
  end

  def to_param
    username
  end

end
