Rails.application.routes.draw do
  resources :elements
  get 'home/index'
  get 'home/new_game'
  root 'home#new_game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
