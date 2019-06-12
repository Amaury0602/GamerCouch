class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :user_id, uniqueness: { scope: :game_id }
end
