class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.float :rating
      t.integer :number_of_reviews
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.string :categories, array: true, default: []

      t.timestamps
    end
  end
end
