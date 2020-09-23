class Fridge < ApplicationRecord
    belongs_to :user
    has_many :fridge_items
    has_many :items, through: :fridge_items
end
