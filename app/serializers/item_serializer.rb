class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category, :sub_category, :quantity, :image
end
