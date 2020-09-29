Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:index, :create, :show] do
      #     get 'following'
      #     get 'followed'
      #   end
      resources :users do
        post '/follow', to: 'users#follow'
        post '/unfollow', to: 'users#unfollow'
        get '/followers', to: 'users#followers'
        get '/followees', to: 'users#followees'
      end
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
