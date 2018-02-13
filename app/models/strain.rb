# == Schema Information
#
# Table name: strains
#
#  created_at  :datetime         not null
#  description :string
#  id          :integer          not null, primary key
#  lineage     :string
#  name        :string
#  token       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_strains_on_name   (name) UNIQUE
#  index_strains_on_token  (token) UNIQUE
#

class Strain < ApplicationRecord
  has_secure_token
end
