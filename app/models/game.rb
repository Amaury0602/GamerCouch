class Game < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes
  validates :name, presence: true, allow_blank: false
  validates :platform, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_all,
    against: [ :name, :year, :category, :platform ],
    using: {
      tsearch: { prefix: true }
    }

  def match(user)
    other_users = []
    self.likes.each do |like|
      other_users << like.user
    end
    other_liked_games = []
    other_users.each do |user|
      user.likes.each do |like|
        other_liked_games << like.game
      end
    end
    @matchings = user.games_liked & other_liked_games
    @matchings = @matchings.reject { |game| game == self }
    hash = {}
    @matchings.each do |game|
      hash[game] = game.likes.where(user_id: self.users).size.fdiv(likes.size) * 100
    end
    hash = hash.sort_by { |game, score| score }.reverse
  end

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

def matching_score(user)
  total = []
  result = 0
  n = 0
  self.match(user).each do |game|
    total << game[1]
  end
  total.sort.each do |score|
    n += 1
    result += score * n
  end
  a = (1..n).sum
  a == 0 ? result : (result / a).round(0)
  end
end
