class GamesController < ApplicationController
  def index
    if params[:sort] == "like"
      @games = Game.order("like_count DESC")
    elsif params[:sort] == "comment"
      @games = Game.order("comment_count DESC")
    else
      @games = Game.order("name ASC") # Change -> name ASC no pertinent
    end

    if params[:search_query].present?
      @games = @games.search_all(params[:search_query])
    end

    #  params[:search_query].present? && params[:sort] == "like"
    #   @games = Game.order("like_count DESC")
    # elsif params[:search_query].present? && params[:sort] == "comment" # TO DO -> joint table
    #   @games = Game.order("like_count ASC")
    # elsif params[:sort].present?
    #   if params[:sort] == "like"

    #   elsif params[:sort] == "comment" # TO DO -> add migration
    #     @games = Game.order("comment_count ASC")
    #   end
    # else

    # end
  end

  def show
    @game = Game.find(params[:id])
    @comment = Comment.new
  end

  def right_choice
    @game = Game.find(params[:id])
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
  end

  def game_alike
    @game = Game.find(params[:id])
    @three_most_liked_games = @game.three_most_liked
  end
end
