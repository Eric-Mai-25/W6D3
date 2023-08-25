Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy, :show]
  resources :artworks, only: [:create, :update, :destroy, :show]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :index, :destroy]

  resources :users do
    resources :artworks, only: [:index]
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'user#update'
  # delete '/users/:id', to: 'users#destroy'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
