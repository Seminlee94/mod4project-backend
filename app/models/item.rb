class Item < ApplicationRecord
    has_many :cart_items
    has_many :fridge_items
    has_many :fridge, through: :fridge_items
    has_many :carts, through: :cart_items
end
