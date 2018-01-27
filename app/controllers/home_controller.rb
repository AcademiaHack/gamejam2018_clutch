class HomeController < ApplicationController
  layout 'game', only: [:new_game]

  def index
    @games = Game.ended
    @game = Game.waiting_p2
  end

  def new_game

  end
end
