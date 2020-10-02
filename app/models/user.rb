class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :user_carts
    has_many :carts, through: :user_carts
    has_one :fridge
    has_many :recipes
    
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :follower_follows, source: :follower

    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow" 
    has_many :followees, through: :followee_follows, source: :followee

end
