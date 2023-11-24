# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
top_rated_movies = JSON.parse(URI.open(url).read)

puts "Destroying all existing movies in database"

Movie.destroy_all

puts "Entering the movie creation loop"
top_rated_movies["results"].each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], rating: movie["vote_average"], poster_url: movie["poster_path"])
end

puts "Loop done, movies created"
