puts "We are about to destroy the entire DataBase, please remain calm"
Game.destroy_all
puts ">> Games were all destroyed"
puts ""
User.destroy_all
puts ">> Users were all destroyed"
puts ""
Like.destroy_all
puts ">> Likes were all destroyed"
puts ""
Comment.destroy_all
puts ">> Comments were all destroyed"
puts ""
puts ""

puts ">> We add some games :)"

def create_game(title)
  url = "https://api-v3.igdb.com/games"
  data = "fields name, platforms.name, cover.url, screenshots.url, release_dates.y, summary;search \"#{title}\";"
  response = RestClient.post(url, data, :content_type => "application/x-www-form-urlencoded", :'user-key' => "3d5164cf92d5dd00f6d364c5d713d5ab")
  request = JSON.parse(response)
  platforms = []
  request.each do |game|
    name = game['name']
    description = game['summary']
    if !game['cover'].nil?
      photo = game['cover']['url'][2..-1].gsub(/t_thumb/, 't_logo_med')
    else
      photo = nil
    end
    screens = []
    if !game['screenshots'].nil?
      game['screenshots'].each do |screen|
        screens << screen['url'][2..-1].gsub(/t_thumb/, 't_screenshot_big')
      end
    else
      screens << ""
    end

    if !game['release_dates'].nil?
      date = game['release_dates'][0]['y']
    else
      date = "undefined"
    end
    if !game['platforms'].nil?
      game['platforms'].each do |platform|
        platforms << platform['name']
      end
      platforms_int = platforms.join(", ")
    else
      platforms_int = "undefined"
    end
    game = Game.new(name: name, platform: platforms_int, year: date, description: description, screens: screens )
    if !photo.nil?
      game.remote_photo_url = "https://#{photo}"
    end
    game.save
    platforms.clear
  end
end

create_game("sekiro")
create_game("zelda breath of the wild")
create_game("twilight princess")
create_game("darksiders")
create_game("star wars jedi knight")
create_game("final fantasy X")


puts "Creating users"

150.times do
  User.create(email: Faker::Internet.unique.email, password: Faker::Name.unique.name, username:Faker::Name.unique.name)
end

game_ids = []
Game.all.each do |game|
  game_ids << game.id
end

user_ids = []
User.all.each do |user|
  user_ids << user.id
end

puts "Creating Likes"


sekiro = Game.find_by(name: "Sekiro: Shadows Die Twice")
zelda = Game.find_by(name: "The Legend of Zelda: Twilight Princess")
zelda_botw = Game.find_by(name: "The Legend of Zelda: Breath of the Wild" )
star_wars = Game.find_by(name: "Star Wars: Jedi Knight II - Jedi Outcast" )
dark = Game.find_by(name: "Darksiders")
ff_ten = Game.find_by(name: "Final Fantasy X")
dark_two = Game.find_by(name: "Darksiders II")

# mario_kart_ds = Game.find_by(name: "Mario Kart DS")


i = 0
24.times do
  Like.create(game: sekiro, user: User.all[i])
  sekiro.like_count += 1
  sekiro.save
  i += 1
end
j = 10
27.times do
  Like.create(game: zelda, user: User.all[j])
  zelda.like_count += 1
  zelda.save
  j += 1
end
k = 0
21.times do
  Like.create(game: zelda_botw, user: User.all[k])
  zelda_botw.like_count += 1
  zelda_botw.save
  k += 1
end
l = 17
28.times do
  Like.create(game: star_wars, user: User.all[l])
  star_wars.like_count += 1
  star_wars.save
  l += 1
end
n = 35
30.times do
  Like.create(game: ff_ten, user: User.all[n])
  ff_ten.like_count += 1
  ff_ten.save
  n += 1
end


m = 10
34.times do
  Like.create(game: dark, user: User.all[m])
  dark.like_count += 1
  dark.save
  m += 1
end

o = 15
22.times do
  Like.create(game: dark_two, user: User.all[o])
  dark_two.like_count += 1
  dark_two.save
  o += 1
end



# 100.times do
#   game_sample_id = game_ids.sample
#   game = Game.find(game_sample_id)
#   like = Like.new(game: game, user_id: user_ids.sample)
#   if like.save
#     game.like_count += 1
#     game.save
#   end
# end




puts "Creating Comments"
10.times do
  game_sample_id = game_ids.sample
  game = Game.find(game_sample_id)
  comment = Comment.new(game_id: game_ids.sample, user_id: user_ids.sample)
  comment1 = Faker::Quote.famous_last_words
  comment2 = Faker::Restaurant.review
  tab_comment = [comment1 , comment2]
  comment.content =  tab_comment.sample
  if comment.valid?
    game.comment_count += 1
    comment.save
  end
end

puts ">> It's done"

