class User < ActiveRecord::Base

  has_many :shouts

  has_many :following_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users, through: :following_user_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

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

end
