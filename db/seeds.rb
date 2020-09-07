# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def puts_with_divider(message)
  '*' * 10
  p message
  '*' * 10
end

puts_with_divider 'Creating Instruments...'
20.times.each do
  instrument_name = Faker::Music::instrument
  Product.create!(name: instrument_name , description: "Description for #{instrument_name}", category: rand(4))
end

puts_with_divider 'Seeding Completed'
