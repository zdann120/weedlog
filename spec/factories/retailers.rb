# == Schema Information
#
# Table name: retailers
#
#  city           :string
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  name           :string
#  state          :string
#  street_address :string
#  updated_at     :datetime         not null
#  zip            :string
#
# Indexes
#
#  index_retailers_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :retailer do
    name "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
