class GamesController < ApplicationController
  layout 'game'

  def index
  end

  def select
    
  end

  def join
    game = Game.find_by(code: params[:code])
    if game
      redirect_to game_turns_path(game_id: game.id)
    else
      redirect_to games_select_path
    end
  end

  def create
    game = Game.new
    game.turns.build
    if game.save
      redirect_to game_turns_path(game_id: game.id)
    else
      redirect_to root_path
    end
  end
end
