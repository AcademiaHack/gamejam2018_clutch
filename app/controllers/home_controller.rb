class HomeController < ApplicationController
  def index
    @games = Game.ended
    @game = Game.waiting_p2
  end
end
