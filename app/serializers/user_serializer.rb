class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :address

  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    @user.to_json(
        :include => {
            :cart => { :include => { 
                :items => {:only => [:item_id, :name, :sales_price]}
            }
        }
    }, :except => [:password])
  end
end
