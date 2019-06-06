class LikesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @like = Like.new
    @like.user = current_user
    @like.game = @game
    authorize @like
    if @like.save
      @game.like_count +=1
      @game.save
    end
    redirect_to games_path
  end
end
