class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :price_per_day
      t.integer :street_number
      t.string :street
      t.string :zip_code
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
