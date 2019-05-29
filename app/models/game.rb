class Game < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true, allow_blank: false
  validates :platform, presence: true
end
