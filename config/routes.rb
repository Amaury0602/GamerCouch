Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
  # root to: 'devise/registrations#new'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  resources :games, only: [:show, :index] do
    resources :comments, only: :create

    resources :likes, only: [:create]
  end
  resources :likes, only: [:destroy]

  post 'games/:id/wish', to: "wishes#create", as: :wish
  post 'tracking', to: "games#tracking", as: :tracking
  get '/dashboard', to: "pages#dashboard", as: :dashboard
  get 'games/:id/game_alike', to: "games#game_alike", as: :game_alike
end
