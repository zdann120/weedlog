class CreateRetailers < ActiveRecord::Migration[5.2]
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
    add_index :retailers, :name, unique: true
  end
end
