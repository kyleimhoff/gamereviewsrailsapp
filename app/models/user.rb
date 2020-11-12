class User < ApplicatonRecord 
    has_many :game_reviews
    has_many :games, through: :game_reviews
end