class UserSerializer
# class UserSerializer < ActiveModel::Serializer
  # attributes :username, :name, :address

  def initialize(user_object)
    @user = user_object
  end

  # def to_serialized_json
  #   @user.to_json(
  #     :include => {
  #       :follower_follows => { 
  #         :include => [:follower]
  #       },
  #       :followee_follows => { 
  #         :include => [:followee]
  #       }
  #   }, :except => [:password])
  # end

end
