require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe '#instance methods' do
    it 'can see only distinct plants' do
      garden1 = Garden.create!(name: "Stardew Gardens", organic: true)

      plot1 = garden1.plots.create!(number: 4, size: "Small", direction: "West")
      plot2 = garden1.plots.create!(number: 5, size: "Tiny", direction: "East")

      plant1 = plot1.plants.create!(name: "Cauliflower", description: "Why is this worth so much??", days_to_harvest: 7)
      plant2 = plot1.plants.create!(name: "Coffee Beans", description: "Is someone gonna help me harvest all these coffee beans??", days_to_harvest: 13)
      plant3 = plot2.plants.create!(name: "Starfruit", description: "WERE RICH!!!", days_to_harvest: 9)
      plant4 = plot2.plants.create!(name: "Cauliflower", description: "This is still worth a ridiculous amount", days_to_harvest: 7)
      plant5 = plot2.plants.create!(name: "Ancient Fruit", description: "???", days_to_harvest: 101)
      expect(garden1.all_distinct_plants.first.name).to eq("Cauliflower")
      expect(garden1.all_distinct_plants.last.name).to eq("Starfruit")
    end
  end
end
