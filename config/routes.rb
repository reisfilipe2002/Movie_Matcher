Rails.application.routes.draw do
  resources :recommendations, only: [:index, :show, :new, :create, :destroy]
  resources :favourite_movies
  get 'users/:id/chooseafavorite', to: 'profiles#choose_favorite_movies', as: :selection

  get '/profile', to: 'profiles#show', as: :profile
  delete 'profiles/:id', to: 'profiles#destroy', as: :delete_profile

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home', to: 'pages#home', as: :home
  post '/chats', to: 'chats#create'
  resources :watchlists, only: [:index]
end
