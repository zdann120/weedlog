class CreateStrains < ActiveRecord::Migration[5.2]
  def change
    create_table :strains do |t|
      t.string :token
      t.string :name
      t.string :lineage
      t.string :description

      t.timestamps
    end
    add_index :strains, :token, unique: true
    add_index :strains, :name, unique: true
  end
end
