class Game < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes
  validates :name, presence: true, allow_blank: false
  validates :platform, presence: true
  mount_uploader :photo, PhotoUploader
end
