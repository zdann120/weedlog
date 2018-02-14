class CalculateAveragesJob < ApplicationJob
  queue_as :default

  def perform
    Strain.all.each do |strain|
      avg = strain.reviews.average(:rating)
      strain.average_rating = avg
      strain.save!
    end
  end
end
