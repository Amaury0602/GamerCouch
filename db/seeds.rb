puts "We are about to destroy the entire DataBase, please remain calm"
User.destroy_all
puts ">> Users were all destroyed"
puts ""
Game.destroy_all
puts ">> Games were all destroyed"
puts ""
Like.destroy_all
puts ">> Likes were all destroyed"
puts ""
puts ""

puts ">> We add some games :)"

url = "https://api-v3.igdb.com/games"
data_one = 'fields name, platforms.name, cover.url, release_dates.y;search "mario";'
data_two = 'fields name, platforms.name, cover.url, release_dates.y;search "metal gear solid";'
response_one = RestClient.post(url, data_one, :content_type => "application/x-www-form-urlencoded", :'user-key' => "3d5164cf92d5dd00f6d364c5d713d5ab")
request_one = JSON.parse(response_one)
response_two = RestClient.post(url, data_two, :content_type => "application/x-www-form-urlencoded", :'user-key' => "3d5164cf92d5dd00f6d364c5d713d5ab")
request_two = JSON.parse(response_two)

platforms_one = []

request_one.each do |game|
  name = game['name']
  photo = game['cover']['url'][2..-1]
  date = game['release_dates'][0]['y']
  game['platforms'].each do |platform|
    platforms_one << platform['name']
  end
  platforms = platforms_one.join(", ")
  game = Game.new(name: name, platform: platforms, year: date )
  game.remote_photo_url = "https://#{photo}"
  game.save
  platforms_one.clear
end

platforms_two = []

request_two.each do |game|
  name = game['name']
  photo = game['cover']['url'][2..-1]
  date = game['release_dates'][0]['y']
  game['platforms'].each do |platform|
    platforms_two << platform['name']
  end
  platforms = platforms_two.join(", ")
  game = Game.new(name: name, platform: platforms, year: date )
  game.remote_photo_url = "https://#{photo}"
  game.save
  platforms_two.clear
end


15.times do
  User.create(email: Faker::Internet.unique.email, password: Faker::Name.unique.name)
end

# 50.times do
#   like = Like.new(game_id: Faker::Number.between(1, 20), user_id: Faker::Number.between(1, 15))
#   like.save if like.valid?
# end

# Game.create(name: "Mario Kart Delux 8", year: 2015, category: "race", platform: "Switch")

# Game.create(name: "Spiderman", year: 2018, category: "action", platform: "PS4")
# puts ">> It's done"
















puts ">> We create one like :)"
Like.create(game_id: 25, user_id: 17)









