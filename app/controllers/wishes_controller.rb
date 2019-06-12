class WishesController < ApplicationController
  def create
    @game = Game.find(params['id'])
    @wish = Wish.new
    @wish.user = current_user
    @wish.game = @game
    authorize @wish
    if @wish.save
      redirect_to games_path
    end

  end
end
