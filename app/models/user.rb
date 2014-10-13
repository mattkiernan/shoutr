class User < ActiveRecord::Base

  has_many :shouts

  has_many :following_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users, through: :following_user_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
