require 'rails_helper'

RSpec.describe 'gardens show page' do

  # User Story 3, Garden's Plants
  # As a visitor
  # When I visit a garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest
  describe 'when i visit a gardens show page'
    it 'can see a unique list of all my plots plants of plants less than 100 days to harvest' do
      garden1 = Garden.create!(name: "Stardew Gardens", organic: true)

      plot1 = garden1.plots.create!(number: 4, size: "Small", direction: "West")
      plot2 = garden1.plots.create!(number: 5, size: "Tiny", direction: "East")

      plant1 = plot1.plants.create!(name: "Cauliflower", description: "Why is this worth so much??", days_to_harvest: 7)
      plant2 = plot1.plants.create!(name: "Coffee Beans", description: "Is someone gonna help me harvest all these coffee beans??", days_to_harvest: 13)
      plant3 = plot2.plants.create!(name: "Starfruit", description: "WERE RICH!!!", days_to_harvest: 9)
      plant4 = plot2.plants.create!(name: "Cauliflower", description: "This is still worth a ridiculous amount", days_to_harvest: 7)
      plant5 = plot2.plants.create!(name: "Ancient Fruit", description: "???", days_to_harvest: 101)

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to_not have_content(@plant5.name)
    end
end
