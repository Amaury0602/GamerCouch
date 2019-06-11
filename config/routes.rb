Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
  # root to: 'devise/sessions#new'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :games, only: [:show, :index] do
    resources :comments, only: :create
    resources :likes, only: :create
    resources :users, only: :create
  end

  post 'tracking', to: "games#tracking", as: :tracking
  get 'games/:id/game_alike', to: "games#game_alike", as: :game_alike
end
