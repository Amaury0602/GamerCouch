# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts ">> We destroy evertything !"
Game.destroy_all

puts ">> We add some games :)"
Game.create(name: "Mario Kart Delux 8", year: 2015, category: "race", platform: "Switch")
puts ">> Game 1 added"
Game.create(name: "Spiderman", year: 2018, category: "action", platform: "PS4")
puts ">> Game 2 added"
puts ">> It's done"
