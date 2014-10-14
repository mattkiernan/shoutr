class FollowingRelationship < ActiveRecord::Base
  belongs_to :followed_user, class_name: "User"

  validate :users_can_not_follow_themselves

  def users_can_not_follow_themselves
    if follower_id == followed_user_id
      errors.add(:base, "Users cannot follow themselves")
    end
  end
end
  
