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

puts 'Clearing seeds'
Movie.destroy_all
List.destroy_all

puts 'creating many movies'
20.times do
  rating = (rand(0..100) * 0.1).round(1)
  title = Faker::Lorem.word(exclude_words: nil)
  overview = Faker::Quote.famous_last_words
  poster_url = Faker::LoremFlickr.image

  Movie.create(
    title:,
    overview:,
    poster_url:,
    rating:
  )
end

puts 'creating many lists'
5.times do
  List.create!(
    name: Faker::Lorem.word(exclude_words: nil)
  )
end

puts 'done'
