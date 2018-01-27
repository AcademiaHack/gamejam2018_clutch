Rails.application.routes.draw do
  get 'home/index'
  get 'home/new_game'
  get 'home/new_player_spreaders'
  root 'home#new_game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
