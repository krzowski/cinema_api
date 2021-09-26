class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :imdb_id, null: false
      t.jsonb :omdb_data, null: false, default: {}
      t.datetime :omdb_data_updated_at

      t.timestamps
    end
  end
end
