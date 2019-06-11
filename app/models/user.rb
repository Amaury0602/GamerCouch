class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :games
  has_many :liked_games, through: :likes, source: :game
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
    mount_uploader :avatar, PhotoUploader
  def games_liked
    likes = []
    self.likes.each do |like|
      likes << like.game
    end
    return likes
  end
end
