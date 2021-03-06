class GamesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index, :tracking]
  skip_after_action :verify_authorized


  def index
    if params[:sort] == "like"
      @games = Game.order("like_count DESC")
    elsif params[:sort] == "comment"
      @games = Game.order("comment_count DESC")
    else
      @games = Game.where.not(id: current_user.liked_games.pluck(:id))
      @games = @games.sort { |a, b| a.matching_score(current_user) <=> b.matching_score(current_user) }.reverse
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

  def tracking
    if params[:tracking]
    @games = Game.find(params[:tracking])
    @user = current_user
    @games.each do |game|
      authorize game
      @like = Like.new(game_id: game.id, user_id: @user.id)
      @like.save
    end
      redirect_to games_path
    else
      redirect_to root_path
    end
end

  def game_alike
    @game = Game.find(params[:tracking].to_i)
    authorize @game
    @three_most_liked_games = @game.three_most_liked
  end
end
