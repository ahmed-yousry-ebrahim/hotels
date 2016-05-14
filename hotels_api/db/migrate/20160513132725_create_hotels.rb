class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.float :star_rating
      t.integer :accomodation_type_id

      t.timestamps null: false
    end
  end
end
