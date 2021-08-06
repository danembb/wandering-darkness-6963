# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Garden.create(name: 'Turing Community Garden', organic: true)
# Garden.create(name: 'Main Street Garden', organic: false)
#
# Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
# Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
# Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
# Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')
@garden1 = Garden.create!(name: "Stardew Gardens", organic: true)

@plot1 = @garden1.plots.create!(number: 4, size: "Small", direction: "West")
@plot2 = @garden1.plots.create!(number: 5, size: "Tiny", direction: "East")

@plant1 = @plot1.plants.create!(name: "Cauliflower", description: "Why is this worth so much??", days_to_harvest: 7)
@plant2 = @plot1.plants.create!(name: "Coffee Beans", description: "Is someone gonna help me harvest all these coffee beans??", days_to_harvest: 13)
@plant3 = @plot2.plants.create!(name: "Starfruit", description: "WERE RICH!!!", days_to_harvest: 9)
@plant4 = @plot2.plants.create!(name: "Cauliflower", description: "This is still worth a ridiculous amount", days_to_harvest: 7)
@plant5 = @plot2.plants.create!(name: "Ancient Fruit", description: "???", days_to_harvest: 101)
