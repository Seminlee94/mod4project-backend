class UserSerializer
# class UserSerializer < ActiveModel::Serializer
#   attributes :username, :name, :address

  # def initialize(user_object)
  #   @user = user_object
  # end

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

  def followers
    @user.followers.map{ |user| UserSerializer.new(user) }
  end

  def followees
    @user.followees.map { |user| UserSerializer.new(user) }
  end

  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
      options = {
          include: {
              follower_follows: {
                  include: [:follower]
              }, 
              followee_follows: {
                  include: [:followee]
              }
          }
      }
      @user.to_json(options)
  end

end
