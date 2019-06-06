class CommentsController < ApplicationController
  def create
    @action = params[:from]
    @game = Game.find(params[:game_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.game = @game
    @comment.user = current_user
    if @comment.save
      @game.comment_count += 1
      @game.save
      if @action == "show"
        respond_to do |format|
          format.html { redirect_to game_path(@game) }
          format.js
        end
      else
        redirect_to game_path(@game)
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
