Rails.application.routes.draw do
  resources :user_carts
  resources :follows
  resources :favorite_recipes
  resources :carts
  resources :fridges
  resources :fridge_items
  resources :cart_items
  resources :items
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show] do
        member do
          delete 'unfollow'
          get 'following'
          get 'followed'
        end
      end
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    
    end
  end

end
