class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_item
    has_many :items, through: :cart_item
end
