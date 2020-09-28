class Cart < ApplicationRecord
    has_many :cart_item
    has_many :items, through: :cart_item
    has_many :user_cart
    has_many :users, through: :user_cart
end
