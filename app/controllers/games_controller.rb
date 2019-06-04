class GamesController < ApplicationController

  def index
    @games = Game.select("games.*, COUNT(likes.id) like_count")
      .joins(:likes)
      .group("games.id")
      .order("like_count DESC")
  end

  def show
    @game = Game.find(params[:id])
    @comment = Comment.new
  end

  def right_choice
    @game = Game.find(params[:id])
  #   Game.affinity
  #   other_users = @game.likes.where.not(user_id: current_user).pluck(:user_id)
  #   your_likes = []
  #   your_likes = current_user.likes.map do |like|
  #     like.game
  #   end
  #   other_users.each do |user|
  #     User.find(user).likes.each do |like|
  #       affinity(like.game)
  #     end
  #   end
  end
end
