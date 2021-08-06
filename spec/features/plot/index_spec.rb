require 'rails_helper'

RSpec.describe 'plot index page' do
  before :each do
    @garden1 = Garden.create!(name: "Stardew Gardens", organic: true)

    @plot1 = @garden1.plots.create!(number: 10, size: "Small", direction: "West")
    @plot2 = @garden1.plots.create!(number: 8, size: "Tiny", direction: "East")

    @plant1 = @plot1.plants.create!(name: "Cauliflower", description: "Why is this worth so much??", days_to_harvest: 7)
    @plant2 = @plot1.plants.create!(name: "Coffee Beans", description: "Is someone gonna help me harvest all these coffee beans??", days_to_harvest: 13)
    @plant3 = @plot2.plants.create!(name: "Starfruit", description: "WERE RICH!!!", days_to_harvest: 9)
  end

  # User Story 1, Plots Index Page
  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see names of all that plot's plants
  describe 'when i visit the plots index page' do
    it 'can see all plot numbers and names of all a plots plants' do
      visit '/plots/'

      expect(page).to have_content(@plot1.number)
      expect(page).to_not have_content(@plot2.number)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to_not have_content(@plant3.name)
    end
  end
end
