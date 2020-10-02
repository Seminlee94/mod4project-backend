class Api::V1::RecipesController < ApplicationController

    def index
        recipes = Recipe.all

        render json: recipes, except: [:created_at, :updated_at]
    end
    
    def show
        recipe = Recipe.find(params[:id])
        render json: recipe, except: [:created_at, :updated_at]
    end

    def create
        recipe = Recipe.search(params[:name])
        render json: recipe, except: [:created_at, :updated_at]
    end
    
    def update
        recipe = Recipe.find(params[:id])
        recipe.update(recipe_params)
        render json: recipe, except: [:created_at, :updated_at]
    end

    def delete
        recipe = Recipe.find(params[:id])

        render json: {}
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit( :title, :picture, :source_url, :ingredients, :user_id )
    end

end
