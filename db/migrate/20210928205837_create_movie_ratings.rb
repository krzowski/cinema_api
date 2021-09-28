class CreateMovieRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_ratings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating, null: false
      t.check_constraint("rating IN (1, 2, 3, 4, 5)")

      t.timestamps
    end
  end
end
