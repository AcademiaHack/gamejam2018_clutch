class HomeController < ApplicationController
  layout 'game', only: [:new_game]

  def index
  end

  def new_game

  end
end
