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
    respond_to do |format|
      format.html { redirect_to games_path }
      format.js
    end
  end

end

