Rails.application.routes.draw do

  # unauthenticated do
  #    root :to => 'devise/sessions#new'
  # end
  # root to: get 'sign_in', :to =>
  devise_for :users
    root to: 'pages#home'

  # devise_scope :user do
  #   get "/users/sign_in" => "registrations#new"
  # end

  #   root to: "devise/sessions#new"
   # root to:
  # root to: 'devise/registrations#new'

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
