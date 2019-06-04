class GamesController < ApplicationController

  def index
    @games = Game.select("games.*, COUNT(likes.id) like_count")
      .joins(:likes)
      .group("games.id")
      .order("like_count DESC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
