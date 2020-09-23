class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category, :sub_category, :quantity, :image

  def initialize(item_object)
    @item = item_object
  end

end
