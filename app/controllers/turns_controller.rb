class TurnsController < ApplicationController
  layout 'game'
  
  def index
    @game = Game.find(params[:game_id])
    @turn = @game.turns.last
  end
end
