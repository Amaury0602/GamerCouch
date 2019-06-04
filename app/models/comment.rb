class Comment < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :content, length: { minimum: 20, maximum: 400 }
end
