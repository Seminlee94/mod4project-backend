class Api::V1::FridgeItemsController < ApplicationController

    def index
        fridge_items = FridgeItem.all
        render json: FridgeItemSerializer.new(fridge_items).to_serialized_json
    end
    
    def show
        fridge_item = FridgeItem.find(params[:id])
        render json: FridgeItemSerializer.new(fridge_item).to_serialized_json
    end
    
    def create
        fridge_item = FridgeItem.create(fridge_item_params)
        render json: FridgeItemSerializer.new(fridge_item).to_serialized_json
    end

    def update
        fridge_item = FridgeItem.find(params[:id])
        fridge_item.update(fridge_item_params)
        render json: FridgeItemSerializer.new(fridge_item).to_serialized_json
    end
    
    def destroy
        fridge_item = FridgeItem.find(params[:id])
        fridge_item.destroy
    
        render json: {}
    end
    
    private
    
    def fridge_item_params
        params.require(:fridge_item).permit(:fridge_id, :item_id)
    end
    
end
