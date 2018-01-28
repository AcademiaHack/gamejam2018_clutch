class TurnsController < ApplicationController
  layout 'game'
  
  def index
    @game = Game.find(params[:game_id])
    @turn = @game.turns.last
    @current_slot = session[:me] ? session[:me]['slot'] : @turn.slot
    @turn.slot > 1 ? set_me(Audience.new(game_id: @game)) : set_me(Player.new)
  end

  private

  def set_me(player)
    session[:me] ||= @turn.take_slot(player)
  end
end
