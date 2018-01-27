class HomeController < ApplicationController
  layout 'game', only: [:new_game, :new_player_spreaders]

  def index
  end

  def new_game

  end

  def new_player_spreaders
  end

end
