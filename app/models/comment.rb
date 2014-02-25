class Comment < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :post_id
  validates_presence_of :content
  belongs_to :user
  belongs_to :post
end
