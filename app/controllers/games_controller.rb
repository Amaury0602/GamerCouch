class GamesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if params[:sort] == "like"
      @games = Game.order("like_count DESC")
    elsif params[:sort] == "comment"
      @games = Game.order("comment_count DESC")
    else
      @games = Game.all.sort { |a, b| a.matching_score(current_user) <=> b.matching_score(current_user) }.reverse
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
end
