Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: [:show, :index] do
    resources :likes, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
