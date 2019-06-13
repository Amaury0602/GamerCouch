#gitrequire 'csv'

# puts "We are about to destroy the entire DataBase, please remain calm"
# Game.destroy_all
# puts ">> Games were all destroyed"
# puts ""
# User.destroy_all
# puts ">> Users were all destroyed"
# puts ""
Like.destroy_all
puts ">> Likes were all destroyed"
# puts ""
# Comment.destroy_all
# puts ">> Comments were all destroyed"
# puts ""
# puts ""

# puts ">> We add some games :)"

# def create_game(title)
#   url = "https://api-v3.igdb.com/games"
#   data = "fields name, platforms.name, cover.url, screenshots.url, release_dates.y, summary;search \"#{title}\";"
#   response = RestClient.post(url, data, :content_type => "application/x-www-form-urlencoded", :'user-key' => "3d5164cf92d5dd00f6d364c5d713d5ab")
#   request = JSON.parse(response)
#   platforms = []
#   request.each do |game|
#     name = game['name']
#     description = game['summary']
#     if !game['cover'].nil?
#       photo = game['cover']['url'][2..-1].gsub(/t_thumb/, 't_logo_med')
#     else
#       photo = nil
#     end
#     screens = []
#     if !game['screenshots'].nil?
#       game['screenshots'].each do |screen|
#         screens << screen['url'][2..-1].gsub(/t_thumb/, 't_screenshot_big')
#       end
#     else
#       screens << ""
#     end

#     if !game['release_dates'].nil?
#       date = game['release_dates'][0]['y']
#     else
#       date = "undefined"
#     end
#     if !game['platforms'].nil?
#       game['platforms'].each do |platform|
#         platforms << platform['name']
#       end
#       platforms_int = platforms.join(", ")
#     else
#       platforms_int = "undefined"
#     end
#     game = Game.new(name: name, platform: platforms_int, year: date, description: description, screens: screens )
#     if !photo.nil?
#       game.remote_photo_url = "https://#{photo}"
#     end
#     game.save
#     platforms.clear
#   end
# end

# create_game("sekiro")
# create_game("zelda breath of the wild")
# create_game("twilight princess")
# create_game("mario kart")
# # create_game("forza")
# # create_game("metal gear solid")
# # create_game("street fighter IV")

# # create_game("doom")


# puts "Creating users"

# 150.times do
#   User.create(email: Faker::Internet.unique.email, password: Faker::Name.unique.name, username:Faker::Name.unique.name)
# end

game_ids = []
Game.all.each do |game|
  game_ids << game.id
end

user_ids = []
User.all.each do |user|
  user_ids << user.id
end

puts "Creating Likes"

# 500.times do
#   game_sample_id = game_ids.sample
#   game = Game.find(game_sample_id)
#   like = Like.new(game: game, user_id: user_ids.sample)
#   if like.save
#     game.like_count += 1
#     game.save
#   end
# end

sekiro = Game.find_by(name: "Sekiro: Shadows Die Twice")


p Game.find_by(name: "The Legend of Zelda: Twilight Princess")

# i = 0
# 25.times do
#   Like.create(game: sekiro, user: User.all[i])
#   sekiro.like_count += 1
#   i += 1
# end

# j = 0
# 25.times do
#   Like.create(game: sekiro, user: User.all[j])
#   sekiro.like_count += 1
#   i += 1
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

