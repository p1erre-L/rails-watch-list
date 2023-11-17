# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts 'Clearing seeds'
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts user['results'][0]['original_title']

puts 'creating many movies'

for index in 0...20 do
  title = user['results'][index]['original_title']
  overview = user['results'][index]['overview']
  poster_url = "https://image.tmdb.org/t/p/w500/#{user['results'][index]['poster_path']}"
  rating = user['results'][index]['vote_average']

  Movie.create(
    title:,
    overview:,
    poster_url:,
    rating:
  )
end

# puts 'creating many lists'
# 5.times do
#   List.create!(
#     name: Faker::Lorem.word(exclude_words: nil)
#   )
# end

# puts 'creating many bookmarks'
# List.all.each do |list|
#   5.times do
#     bookmark = Bookmark.new(
#       comment: Faker::Quote.famous_last_words
#     )
#     bookmark.list = list
#     bookmark.movie = Movie.all.sample
#     bookmark.save
#   end
# end

puts 'done'
