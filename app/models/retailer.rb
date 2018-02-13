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

class Retailer < ApplicationRecord
  has_many :reviews
end
