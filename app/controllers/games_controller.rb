class GamesController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  skip_before_action :verify_authenticity_token, except: [:index, :show]

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


  def tracking
    @games = Game.find(params[:tracking])
    @user = current_user
    @games.each do |game|
      authorize game
      @like = Like.new(game_id: game.id, user_id: @user.id)

      @like.save
    end
    redirect_to games_path
end
  def game_alike
    @game = Game.find(params[:tracking].to_i)
    authorize @game
    @three_most_liked_games = @game.three_most_liked
  end
end
