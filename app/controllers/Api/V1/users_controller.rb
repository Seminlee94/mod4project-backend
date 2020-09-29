# require byebug
class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        users = User.all
        # render json: users
        render json: UserSerializer.new(users).to_serialized_json
    end

    def show
        user = User.find(params[:id])
        # render json: user
        render json: UserSerializer.new(user).to_serialized_json
    end

    def followers
        user = User.find(params[:user_id])
        render json: { followers: UserSerializer.new(user).followers }, status: :accepted
    end
    
    def followees
        user = User.find(params[:user_id])
        render json: { followers: UserSerializer.new(user).followees }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def follow
        # byebug
        follow = Follow.create(follow_params)
        user = User.find(follow_params[:followee_id])
        if follow.valid?
          render json: { user: UserSerializer.new(user)}, status: :accepted
        else
          render json: { error: "failed to follow user" }, status: :not_acceptable
        end
    end
    
    def unfollow
        follow = Follow.find_by(follower_id: follow_params[:follower_id], followee_id: follow_params[:followee_id])
        user = User.find(follow_params[:followee_id])
        follow.destroy 
        if !follow.save
            render json: { user: UserSerializer.new(user) }, status: :accepted
        else
            render json: { error: "failed to unfollow user" }, status: :not_acceptable
        end
    end

    # def update
    #     user = User.find(params[:id])
    #     user.update(user_params)
    #     render json: user
    # end
    
    # def delete
    #     user = User.find(params[:id])
    #     user.destroy
    #     render json: {}
    # end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :address, :username, :password)
    end

    def follow_params
        params.require(:follow).permit(:follower_id, :followee_id )
    end
     
    

end
