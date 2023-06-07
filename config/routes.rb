Rails.application.routes.draw do
  resources :recommendations do
    collection do
      get 'imdb/:reference', action: 'imdb', as: 'imdb'
      get 'user/:reference', action: 'user', as: 'user'
    end
  end

  resources :favourite_movies, param: :reference do
    collection do
      get 'imdb/:reference', action: 'imdb', as: 'imdb'
      get 'user/:reference', action: 'user', as: 'user'
    end
  end

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'chat', to: 'chats#create'
end
