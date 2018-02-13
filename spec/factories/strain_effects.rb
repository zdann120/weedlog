# == Schema Information
#
# Table name: strain_effects
#
#  created_at :datetime         not null
#  effect_id  :integer
#  id         :integer          not null, primary key
#  strain_id  :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_strain_effects_on_effect_id  (effect_id)
#  index_strain_effects_on_strain_id  (strain_id)
#
# Foreign Keys
#
#  fk_rails_...  (effect_id => effects.id)
#  fk_rails_...  (strain_id => strains.id)
#

FactoryBot.define do
  factory :strain_effect do
    strain nil
    effect nil
  end
end
