class Game < ApplicationRecord 
    has_many :reviews
    has_many :users, through: :reviews
    validates_presence_of :name, :esrb_rating, :description 
    validates_uniqueness_of :name

    scope :order_by_name, -> { reorder(name: :asc)}
end