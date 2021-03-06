class Game < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :likes
  has_many :liked_users, through: :likes, source: :user
  validates :name, presence: true, allow_blank: false
  validates :platform, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_all,
    against: [:name, :year, :category, :platform],
    using: {
      tsearch: { prefix: true }
    }

  def match(user)
    users = Like.where("game_id= ?", self.id).pluck(:user_id)
    if !users.empty?
      other_sql = ActiveRecord::Base.connection.execute("SELECT games.id FROM games
                                                         JOIN likes ON games.id = likes.game_id
                                                         WHERE likes.user_id IN (#{users.join(",")})").values.flatten
    else
      other_sql = []
    end
    my_sql = ActiveRecord::Base.connection.execute("SELECT games.id FROM games
                                                    JOIN likes ON games.id = likes.game_id
                                                    WHERE likes.user_id = #{user.id}").values.flatten
    @matchings = other_sql.map { |g_id| Game.find(g_id) } & my_sql.map{ |g_id| Game.find(g_id) }
    @matchings.reject { |instance| instance == self }
    hash = {}
    @matchings.each do |jeu|
      hash[jeu] = jeu.likes.where(user_id: self.users).size.fdiv(self.likes.size) * 100
    end
    return hash = hash.sort_by { |game, score| score }.reverse
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
  if !self.nil?
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
end
