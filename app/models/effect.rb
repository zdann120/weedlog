class Effect < ApplicationRecord
  has_many :strain_effects
  has_many :strains, through: :strain_effects

  enum mood: %w(Positive Negative Neutral)

  validates :name, :mood, presence: true
  validates :name, uniqueness: {message: 'already exists'}
end
