class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :menurecords
  has_many :user_follows, :class_name => "UserFollow", :foreign_key => :user_id
  has_many :follow_users, :through => :user_follows
  has_many :user_followers, :class_name => "UserFollow", :foreign_key => :follow_user_id
  has_many :follower_users, :through => :user_followers
end
