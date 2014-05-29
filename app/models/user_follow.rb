class UserFollow < ActiveRecord::Base
  belongs_to :follower_user, :class_name => "User", :foreign_key => :user_id
  belongs_to :follow_user, :class_name => "User", :foreign_key => :follow_user_id

  validates :user_id, :presence => true
  validates :follow_user_id, :presence => true
end
