# Post model
class Post < ApplicationRecord
  belongs_to :user

  # validation
  validates_presence_of :title, :content
  validates_length_of :content, minimum: 5, maximum: 100
end
