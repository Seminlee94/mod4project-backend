class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_one :cart
    has_one :fridge
    has_many :followers, through: :follower_follows, source: :follower
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
    has_many :followees, through: :followee_follows, source: :followee
    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow" 

end
