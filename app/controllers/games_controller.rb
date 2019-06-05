class GamesController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index

  def index
    if params[:sort] == "like"
      @games = Game.order("like_count DESC")
    elsif params[:sort] == "comment"
      @games = Game.order("comment_count DESC")
    else
      @games = Game.order("year DESC") # Change -> name ASC no pertinent
    end

    if params[:search_query].present?
      @games = @games.search_all(params[:search_query])
    end
  end
  def show
    @game = Game.find(params[:id])
    authorize @game
    @comment = Comment.new
  end

  def right_choice
    @game = Game.find(params[:id])
    authorize @game
    user_likes = []
    current_user.likes.each do |like|
      like.game.name
      user_likes << like.game
    end
    other_like_users = []
    @game.likes.where.not(user: current_user).each do |like|
      other_like_users << like.user
    end
    @other_like_games = []
    other_like_users.each do |user|
      user.likes.each do |like|
        @other_like_games << like.game
      end
    end
    @other_like_games.uniq
    @matching_games = @other_like_games & user_likes
    @matching_games = @matching_games.reject { |game| game == @game }
    hash = {}
    @matching_games.each do |game|
      hash[game] = @game.match(game)
    end
    @game_score_hash = hash.sort_by { |_game, score| score }.flatten
  end

  def game_alike
    @game = Game.find(params[:id])
    authorize @game
    @three_most_liked_games = @game.three_most_liked
  end
end
