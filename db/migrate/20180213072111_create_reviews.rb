class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :strain, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :comment
      t.string :token

      t.timestamps
    end
    add_index :reviews, :token, unique: true
  end
end
