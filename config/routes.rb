Rails.application.routes.draw do
  resources :favorite_recipes
  resources :carts
  resources :fridges
  resources :fridge_items
  resources :cart_items
  resources :items
  resources :users
  resources :users do
    member do
      delete 'unfollow'
      get 'following'
      get 'followed'
    end
  end


end
