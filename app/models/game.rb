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

  def match(game)
    # user_likes = []
    # current_user.likes.each do |like|
    #   like.game.name
    #   user_likes << like.game
    # end
    # other_like_users = []
    # game.likes.where.not(user: current_user).each do |like|
    #   other_like_users << like.user
    # end
    # @other_like_games = []
    # other_like_users.each do |user|
    #   user.likes.each do |like|
    #     @other_like_games << like.game
    #   end
    # end
    # @other_like_games.uniq
    # @matching_games = @other_like_games & user_likes
    # @matching_games = @matching_games.reject { |instance| instance == game }
    # hash = {}
    # @matching_games.each do |game|
    #   hash[game] = game.likes.where(user_id: game.users).size.fdiv(likes.size) * 100
    # end
    # @game_score_hash = hash.sort_by { |_game, score| score }.flatten

    #comment above if not working
    likes.where(user_id: game.users).size.fdiv(likes.size) * 100
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
end
