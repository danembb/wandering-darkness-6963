class Garden < ApplicationRecord
  has_many :plots

  def all_distinct_plants
    Garden.joins(plots: :plants)
    .select('plants.name')
    .where('days_to_harvest < 100')
    .group('plants.id')
    .order('plants.name')
    .distinct('plants.name')
  end
end

# .joins(plots: :plants)

# self.plots.each do |plot|
#   @all_plants = plot.plants.each do |plant|
#     plant.name
#   end
# end
# @all_plants
