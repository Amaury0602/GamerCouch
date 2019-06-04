Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: [:show, :index] do
    resources :comments, only: :create
    resources :likes, only: :create
  end

  get 'games/:id/right_choice', to: "games#right_choice", as: :right_choice

  get 'games/:id/game_alike', to: "games#game_alike", as: :game_alike
end
