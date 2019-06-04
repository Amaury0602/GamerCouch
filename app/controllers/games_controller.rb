class GamesController < ApplicationController
  def index
    @games = Game.order("like_count DESC")
  end

  def show
    @game = Game.find(params[:id])
    @comment = Comment.new
  end

  def right_choice
    @game = Game.find(params[:id])
    other_users = @game.likes.where.not(user_id: current_user).pluck(:user_id)
    @liked_games = []
    other_users.each do |user|
      User.find(user).likes.distinct.each do |like|
        @liked_games << like.game
      end
    end
    @final_liked_games = []
    @final_liked_games = @liked_games.delete_if do |game|
      game == @game
    end
    @final_liked_games.uniq!

    hash = {}
    @final_liked_games.each do |game|
      hash[game.name] = @game.match(game)
    end
    @likes_hash = hash.sort_by { |_key, value| value }.reverse.to_h
  end

  def game_alike
    @game = Game.find(params[:id])
    @three_most_liked_games = @game.three_most_liked
  end

end
