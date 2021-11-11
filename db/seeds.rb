# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning data...'
Movie.destroy_all
List.destroy_all

puts 'Generating new data...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
result = JSON.parse(movies_serialized)
movies = result['results']
# list of movie hashes

genre_url = 'http://tmdb.lewagon.com/genre/movie/list'
genres_serialized = URI.open(genre_url).read
genre_result = JSON.parse(genres_serialized)
genres_info = genre_result['genres']
# list of genre hashes
genre_ids = []

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  genre_id = movie['genre_ids'][0]
  genre_ids << genre_id
end

genres_info.each do |genre|
  genre_ids.uniq.each do |id|
    if genre['id'] == id
      List.create!(
        name: genre['name']
      )
    end
  end
end

puts "#{Movie.count} movies generated!"
puts "#{List.count} lists generated!"
