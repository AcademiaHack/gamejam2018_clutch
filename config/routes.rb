Rails.application.routes.draw do
  shallow do
    resources :games, only: [:index, :create] do
      resources :turns
      post 'turns/update_user_name' => 'turns#update_user_name'
    end
  end

  get 'games/select'
  get 'games/join' => 'games#join', as: 'game_join'

  # get 'games/index'
  # get 'games/join'
  # get 'games/create'

  get 'home/index'
  get 'home/new_game'
  get 'home/new_player_spreaders'
  get 'home/new_player_strikers'  
  root 'games#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
