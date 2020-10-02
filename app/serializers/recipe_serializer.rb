# class RecipeSerializer < ActiveModel::Serializer
class RecipeSerializer
  # attributes :id, :title, :picture, :source_url, :ingredients, :user_id

  def initialize(recipe_object)
    @recipe = recipe_object
  end

end
