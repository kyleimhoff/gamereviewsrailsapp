class Game < ApplicatonRecord 
    has_many :game_reviews
    has_many :users, through: :game_reviews
    validates_presence_of :name, :esrb_rating, :description 
    validates_uniqueness_of :name
end