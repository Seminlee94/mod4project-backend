Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:index, :create, :show] do
      #     get 'following'
      #     get 'followed'
      #   end
      resources :users
      post '/login', to: 'auth#create'
      get '/users', to: 'users#index'
      get '/profile', to: 'users#profile'
      resources :user_carts
      resources :follows
      resources :favorite_recipes
      resources :carts
      resources :fridges
      resources :fridge_items
      resources :cart_items
      resources :items
    end
  end

end
