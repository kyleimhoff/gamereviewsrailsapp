class Review < ApplicationRecord 
    belongs_to :user 
    belongs_to :game
    validates_presence_of :rating, :review
    validates :rating, numericality: true 
    validates_inclusion_of :rating, in: 1..10 

end