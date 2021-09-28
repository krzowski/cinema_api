class CreateMovieShowings < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_showings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :movie_pricing_category, null: false, foreign_key: true
      t.time :show_time, null: false

      t.timestamps
    end
  end
end
