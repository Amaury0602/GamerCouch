class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = Comment.new(comment_params)
    @comment.game = @game
    @comment.user = current_user
   if @comment.save
    respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'games/show' }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

