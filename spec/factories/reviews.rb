# == Schema Information
#
# Table name: reviews
#
#  comment      :text
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  product_type :string
#  rating       :integer
#  retailer_id  :integer
#  strain_id    :integer
#  token        :string
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_reviews_on_retailer_id  (retailer_id)
#  index_reviews_on_strain_id    (strain_id)
#  index_reviews_on_token        (token) UNIQUE
#  index_reviews_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (strain_id => strains.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :review do
    strain nil
    user nil
    rating 1
    comment "MyText"
    token ""
  end
end
