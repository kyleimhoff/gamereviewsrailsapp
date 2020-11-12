class CreateGameReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :game_reviews do |t|
      t.string :review 
      t.integer :rating 
      t.belongs_to :user 
      t.belongs_to :game
    end
  end
end
