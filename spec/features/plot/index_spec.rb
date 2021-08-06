require 'rails_helper'

RSpec.describe 'plot index page' do
  before :each do
    @garden1 = Garden.create!(name: "Stardew Gardens", organic: true)

    @plot1 = @garden1.plots.create!(number: 4, size: "Small", direction: "West")
    @plot2 = @garden1.plots.create!(number: 5, size: "Tiny", direction: "East")

    @plant1 = @plot1.plants.create!(name: "Cauliflower", description: "Why is this worth so much??", days_to_harvest: 7)
    @plant2 = @plot1.plants.create!(name: "Coffee Beans", description: "Is someone gonna help me harvest all these coffee beans??", days_to_harvest: 13)
    @plant3 = @plot2.plants.create!(name: "Starfruit", description: "WERE RICH!!!", days_to_harvest: 9)
  end

  describe 'when i visit the plots index page' do
    # User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots') x
    # I see a list of all plot numbers x
    # And under each plot number I see names of all that plot's plants x
    it 'can see all plot numbers and names of all a plots plants' do
      visit '/plots/'

      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plot2.number)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end

    # User Story 2, Remove a Plant from a Plot
    # As a visitor
    # When I visit a plot's index page x
    # Next to each plant's name x
    # I see a link to remove that plant from that plot
    # When I click on that link
    # I'm returned to the plots index page
    # And I no longer see that plant listed under that plot
    # (Note: you should not destroy the plant record entirely)

    xit 'can remove a plant from a plot' do
      visit '/plots/'

      expect(page).to have_link("Remove Plant #{@plant1.id}")

      click_on "Remove Plant #{@plant1.id}"

      expect(page).to_not have_content(@plant1.name)
    end
  end
end
