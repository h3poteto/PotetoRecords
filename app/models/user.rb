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


  ID_NOT_FOUND = 'ID_NOT_FOUND'.freeze
  PASSWORD_INVALID = 'PASSWORD_INVALID'.freeze
  def User.authenticate(email, pass)
    user = User.find_by_email(email)
    raise ActiveRecord::RecordNotFound, ID_NOT_FOUND unless user
    raise ActiveRecord::RecordNotFound, PASSWORD_INVALID unless user.valid_password?(pass)
    return user
  end
end
