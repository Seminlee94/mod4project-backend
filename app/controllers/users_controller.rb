# class UsersController < ApplicationController
#     # skip_before_action :authorized, only: [:create]

#     def index
#         users = User.all
#         render json: UserSerializer.new(users).to_serialized_json
#     end
    
#     def show
#         user = User.find(params[:id])
#         render json: UserSerializer.new(user).to_serialized_json
#     end

#     def followers
#         followers = User.find(params[:id]).followed_by
#         render json: followers
#     end

#     def followees
#         followees = User.find(params[:id]).following
#         render json: followees
#     end


#     def profile
#         render json: { user: UserSerializer.new(current_user) }, status: :accepted
#     end

#     def create
#         @user = User.create(user_params)
#         if @user.valid?
#           @token = encode_token({ user_id: @user.id })
#           render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
#         else
#           render json: { error: 'failed to create user' }, status: :not_acceptable
#         end
#     end

#     def update
#         user = User.find(params[:id])
#         user.update(user_params)
#         render json: user
#     end
    
#     def delete
#         user = User.find(params[:id])
#         user.destroy
#         render json: {}
#     end
    
#     private
    
#     def user_params
#         params.require(:user).permit(:name, :address, :username, :password)
#     end
     
    

# end
