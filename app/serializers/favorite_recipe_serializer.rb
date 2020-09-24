class FavoriteRecipeSerializer
  # attributes :id, :user_id, :name

  def initialize(favorite_recipe_object)
    @favorite_recipe = favorite_recipe_object
  end

  def to_serialized_json
    @favorite_recipe.to_json(
        include: {
            :user => { except: [:password, :created_at, :updated_at]}
        })
  end

end
