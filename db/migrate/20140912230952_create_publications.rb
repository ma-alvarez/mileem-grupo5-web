class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :transaction_type
      t.string :property_type
      t.string :address
      t.decimal :area
      t.integer :number_of_rooms
      t.decimal :price
      t.decimal :expenses
      t.integer :age

      t.timestamps
    end
  end
end
