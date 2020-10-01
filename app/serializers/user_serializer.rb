class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :address


  def followers
    object.followers.map{ |user| UserSerializer.new(user) }
  end

  def followees
    object.followees.map { |user| UserSerializer.new(user) }
  end

end
