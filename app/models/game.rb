class Game < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes
  validates :name, presence: true, allow_blank: false
  validates :platform, presence: true
  mount_uploader :photo, PhotoUploader

  def three_most_liked
    liked_games = []
    users.each do |user|
      user.likes.each do |like|
        liked_games << like.game
      end
    end
    counts = Hash.new(0)
    liked_games.each { |name| counts[name] += 1 }
    result_inverse = counts.sort_by { |_key, value| value }.reverse
    r = result_inverse.reject { |game| game[0] == self }
    result_top_3 = r.first(3).map { |result| result[0] }
  end


  #   liked_games = []
  #   users.each do |user|
  #     user.likes.each do |like|
  #       liked_games << like.game
  #     end
  #   end
  #   # return liked_games
  #   # return game_selection = .sort
  #   counts = Hash.new(0)
  #   liked_games.each { |name| counts[name] += 1 }
  #   p counts
  #   result_inverse = counts.sort_by { |_key, value| value }.reverse
  #   p result_reverse.size
  #   r = result_inverse.reject { |game| game == self }
  #   p r.size
  #   result_top_3 = r.first(3).map { |result| result[0] }
  #   # result_top_3.each do |key, _value|
  #   #   return key
  #   # end
  end
