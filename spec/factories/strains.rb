# == Schema Information
#
# Table name: strains
#
#  average_rating :decimal(, )      default(0.0)
#  created_at     :datetime         not null
#  description    :string
#  id             :integer          not null, primary key
#  lineage        :string
#  name           :string
#  token          :string
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_strains_on_name   (name) UNIQUE
#  index_strains_on_token  (token) UNIQUE
#

FactoryBot.define do
  factory :strain do
    name "Girl Scout Cookies"
    lineage "Sativa"
    description "The classic strain."
  end
end
