class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :user_id
end
