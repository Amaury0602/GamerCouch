class WishesController < ApplicationController
  def create
    @game = Game.find(params['id'])
    @wish = Wish.new
    @wish.user = current_user
    @wish.game = @game
    @wish.save
    authorize @wish
  end
end
