class Post < ActiveRecord::Base 
  # validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :datetime
end