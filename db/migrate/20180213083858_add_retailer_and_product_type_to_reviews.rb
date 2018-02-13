class AddRetailerAndProductTypeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :retailer, index: true
    add_column :reviews, :product_type, :string
  end
end
