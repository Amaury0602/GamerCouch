class CommentsController < ApplicationController
  def create
    @action = params[:from]
    @game = Game.find(params[:game_id])
    @comment = Comment.new(comment_params)
    @comment.game = @game
    @comment.user = current_user
   if @comment.save
    respond_to do |format|
        format.html { redirect_to games_path }
        format.js
      end
    else
      if @action == "index"
        render :index
      else
        render :show
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

