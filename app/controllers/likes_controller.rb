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
  
  def destroy
    @like = Like.find(params[:id])
    @game = @like.game
    authorize @like
    @like.destroy
    @like.game.like_count -= 1
    @like.game.save
    respond_to do |format|
      format.html { redirect_to games_path }
      format.js
    end
  end
end

