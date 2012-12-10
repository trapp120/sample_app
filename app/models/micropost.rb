class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  #new (10.18)
  validates :content, presence: true, length: { maximum: 140 }
  #end (10.18)
  validates :user_id, presence: true

  default_scope order: 'microposts.created_at DESC'
end