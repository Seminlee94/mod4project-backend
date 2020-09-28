class CartSerializer < ActiveModel::Serializer
  attributes :id

  def initialize(cart_object)
    @cart_object = cart_object
  end

  def to_serialized_json
    @cart_object.to_json(
        include: {
            # :items => { except: [:created_at, :updated_at]}
            # :user => { except: [:password, :created_at, :updated_at]}
        })
  end

end
