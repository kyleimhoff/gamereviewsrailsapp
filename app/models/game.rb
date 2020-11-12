class Game < ApplicatonRecord 
    has_many :game_reviews
    has_many :users, through: :game_reviews
end