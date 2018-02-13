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
  validates :name, :lineage, :description, presence: true
  validates :name, uniqueness: true
  validates :lineage, inclusion: %w(Indica Sativa Hybrid)
  has_many :reviews
  has_many :strain_effects
  has_many :effects, through: :strain_effects

  def score
    reviews.average(:rating)
  end

end
