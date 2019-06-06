class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = Comment.new(comment_params)
    @comment.game = @game
    authorize @comment
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'games/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
