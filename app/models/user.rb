class User < ApplicationRecord 
    has_secure_password 
    has_many :game_reviews
    has_many :games, through: :game_reviews
    validates :username, presence: true 
    validates :username, uniqueness: true
    
end