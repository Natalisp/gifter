class Comment < ApplicationRecord
  belongs_to :gift
  belongs_to :user
  validates :content, :presence => {:message => 'Name cannot be blank, Comment was not posted'}
end
