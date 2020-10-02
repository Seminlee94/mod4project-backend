class FridgeItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :fridge_id

  def initialize(fridge_item_obj)
    @fridge_item_obj = fridge_item_obj
  end

  def to_serialized_json
    @fridge_item_obj.to_json(
        :include => {
          :item => {
              :except => [:created_at, :updated_at]
          },
          :fridge => {
            :except => [:created_at, :updated_at]
          }
        }
    )
  end

end
