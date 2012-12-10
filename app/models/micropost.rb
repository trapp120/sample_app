class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
  #new (10.14)
  default_scope order: 'microposts.created_at DESC'
end