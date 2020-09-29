class Api::V1::FavoriteRecipesController < ApplicationController

    def index
        favorite_recipes = FavoriteRecipe.all
        render json: FavoriteRecipeSerializer.new(favorite_recipes).to_serialized_json
    end
    
    def show
        favorite_recipe = FavoriteRecipe.find(params[:id])
        render json: FavoriteRecipeSerializer.new(favorite_recipe).to_serialized_json
    end
    
    def create
        favorite_recipe = FavoriteRecipe.create(favorite_recipe_params)
        render json: favorite_recipe
    end

    def update
        favorite_recipe = FavoriteRecipe.find(params[:id])
        favorite_recipe.update(favorite_recipe_params)
        render json: FavoriteRecipeSerializer.new(favorite_recipe).to_serialized_json
    end
    
    def destroy
        favorite_recipe = FavoriteRecipe.find(params[:id])
        favorite_recipe.destroy
    
        render json: {}
    end
    
    private
    
    def favorite_recipe_params
        params.require(:favorite_recipe).permit(:user_id, :name)
    end
end
