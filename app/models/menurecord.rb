class Menurecord < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :parent_id, :presence => true
  validates :date, :presence => true
  validates :color_tag, :presence => true
end
