require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_api = URI.parse(url).open.read
movies = JSON.parse(movies_api)

Movie.destroy_all if Rails.env.development?

puts 'Creating best 10 movies'

movies['results'].first(100).each do |movie|
  puts 'Creating movie'
  movie_seed = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
  movie_seed.save!
  puts 'movie saved !'
end
