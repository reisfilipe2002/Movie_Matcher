# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

# Specify the path to your CSV file
csv_file_path = '/home/reisfilipe/code/reisfilipe2002/Movie_Matcher/movies.csv'

# Open the CSV file and iterate over each row

CSV.foreach(csv_file_path, headers: true).with_index(1) do |row, index|
  # Access data in each row using column names or indices
  break if index > 200

  column2 = row['title']
  title = column2.split('(')[0].strip
  movie_id_tmdb = Tmdb::Movie.find(title)
  poster = Tmdb::Movie.images(movie_id_tmdb[0].id)["posters"]
  poster_path = "https://image.tmdb.org/t/p/w300#{poster["file_path"]}"
  Movie.create!(title: title, poster_url: poster_path)
end
