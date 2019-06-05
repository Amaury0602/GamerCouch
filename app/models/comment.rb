class Comment < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :content, length: { minimum: 1, maximum: 400 }
end
