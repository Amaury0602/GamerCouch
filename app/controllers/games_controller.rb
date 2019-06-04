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
  end

  def game_alike
    @game = Game.find(params[:id])
    @three_most_liked_games = @game.three_most_liked
  end

end
