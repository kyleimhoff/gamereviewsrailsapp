class User < ApplicationRecord 
    has_many :game_reviews
    has_many :games, through: :game_reviews
    validates :username, presence: true 
    validates :username, uniqueness: true
    has_secure_password 
end