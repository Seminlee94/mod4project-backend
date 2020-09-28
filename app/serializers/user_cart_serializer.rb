class UserCartSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :cart_id

  def initialize(user_cart_obj)
    @user_cart_obj = user_cart_obj
  end

  def to_serialized_json
    @user_cart_obj.to_json(
        :include => {
            :user => {
              :except => [:created_at, :updated_at]
            },
            :cart => {
              :include => [:cart_item]
            }
        }
    )
  end

end
