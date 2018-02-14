class AddAverageToStrains < ActiveRecord::Migration[5.2]
  def change
    add_column :strains, :average_rating, :decimal, default: 0
  end
end
