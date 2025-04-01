class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :rating
      t.string :food_preferences, array: true, default: []
      t.string :food_restrictions, array: true, default: []
      t.references :restaurant_owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
