class CreateMoviePricingCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_pricing_categories do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 11, scale: 2

      t.timestamps
    end
  end
end
