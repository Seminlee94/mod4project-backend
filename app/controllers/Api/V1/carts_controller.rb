class Api::V1::CartsController < ApplicationController

    def index
        carts = Cart.all
        render json: carts
        # render json: CartSerializer.new(carts).to_serialized_json
    end

    def show
        cart = Cart.find(params[:id])
        render json: CartSerializer.new(cart).to_serialized_json
    end

    def create
        cart = Cart.create(cart_params)
        render json: cart
    end

    def username
        cart= Cart.find(params[:cart_id])
        render json: {username: CartSerializer.new(cart).username }, status: :accepted 
    end

    
    def update
        cart = Cart.find(params[:id])
        cart.update(cart_params)
        render json: cart
    end

    def delete
        cart = Cart.find(params[:id])

        render json: {}
    end
    
    private
    
    def cart_params
        params.require(:cart).permit(:username)
    end

    
end
