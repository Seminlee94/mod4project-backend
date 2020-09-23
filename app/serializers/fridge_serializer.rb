class FridgeSerializer < ActiveModel::Serializer
  attributes :id, :user_id

  def initialize(fridge_object)
    @fridge = fridge_object
  end

  def to_serialized_json
    @fridge.to_json(
        include: {
            :items => { except: [:created_at, :updated_at]},
            :user => { except: [:password, :created_at, :updated_at]}
        })
  end

end
