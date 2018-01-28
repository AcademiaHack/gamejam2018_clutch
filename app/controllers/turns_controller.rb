class TurnsController < ApplicationController
  layout 'game'
  
  def index
    @game = Game.find(params[:game_id])
    @turn = @game.turns.last
    @current_slot = session[:user] ? session[:user]['current_slot'] : @turn.slot
    @turn.slot > 1 ? set_me(Audience.new(game_id: @game)) : set_me(Player.new)
  end
  
  def update_user_name
    @game = Game.find(permit_user_params[:game_id])
    @turn = @game.turns.last
    @user = @turn.update_name(permit_user_params[:value], session[:user], @game.id)
    session[:user] = @user
  end

  private

  def set_me(user)
    session[:user] ||= @turn.take_slot(user)
  end

  def permit_user_params
    params.permit(:value, :slot, :game_id)
  end
end
