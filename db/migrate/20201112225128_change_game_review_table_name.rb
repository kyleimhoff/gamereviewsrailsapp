class ChangeGameReviewTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :game_reviews, :reviews
  end
end
