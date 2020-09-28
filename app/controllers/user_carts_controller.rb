class UserCartsController < ApplicationController


    def index
        user_carts = UserCart.all
        render json: UserCartSerializer.new(user_carts).to_serialized_json
    end
    
    def show
        user_cart = UserCart.find(params[:id])
        render json: UserCartSerializer.new(user_cart).to_serialized_json
    end
    
    def create
        user_cart = UserCart.create(user_cart_params)
        render json: user_cart
    end

    def update
        user_cart = UserCart.find(params[:id])
        user_cart.update(user_cart_params)
        render json: UserCartSerializer.new(user_cart).to_serialized_json
    end
    
    def destroy
        user_cart = UserCart.find(params[:id])
        user_cart.destroy
    
        render json: {}
    end
    
    private
    
    def user_cart_params
        params.require(:user_cart).permit(:cart_id, :user_id)
    end
    


    
end
