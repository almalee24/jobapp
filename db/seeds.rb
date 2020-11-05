# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = RestClient.get('https://jobs.github.com/positions.json?')
json = JSON.parse(response.body, symbolize_names:true)
json.each do |position|
    Position.create(title: position[:title], description: position[:description], location: position[:location], url: position[:url])
end
