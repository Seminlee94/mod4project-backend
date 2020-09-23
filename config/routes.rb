Rails.application.routes.draw do
  resources :carts
  resources :fridges
  resources :fridge_items
  resources :cart_items
  resources :items
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
