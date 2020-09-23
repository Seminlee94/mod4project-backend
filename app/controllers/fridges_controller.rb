class FridgesController < ApplicationController

    def index
        fridges = Fridge.all

        render json: FridgeSerializer.new(fridges).to_serialized_json
    end

    def show
        fridge = Fridge.find(params[:id])
        render json: FridgeSerializer.new(fridge).to_serialized_json
    end
    
    def update
        fridge = Fridge.find(params[:id])
        fridge.update(fridge_params)
        render json: fridge
    end
    
    private
    
    def fridge_params
        params.require(:fridge).permit(:user_id)
    end

    
end
