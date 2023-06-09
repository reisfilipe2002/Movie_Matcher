# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

User.destroy_all
Movie.destroy_all


# Specify the path to your CSV file
csv_file_path = 'db/data/movies.csv'

# Open the CSV file and iterate over each row

CSV.foreach(csv_file_path, headers: true).with_index(1) do |row, index|
  # Access data in each row using column names or indices

  column2 = row['title']
  title = column2.split('(')[0].strip
  if title.include?("The")
    title = title.sub(/^(.*), The$/, 'The \1')
  end
  movie_results = Tmdb::Movie.search(title)

  unless movie_results.empty?
    movie_id_tmdb = movie_results.first.id
    posters = Tmdb::Movie.images(movie_id_tmdb)["posters"]

    unless posters.empty?
      poster_path = "https://image.tmdb.org/t/p/w300#{posters.first['file_path']}"
      Movie.create!(title: title, poster_url: poster_path)
    end
  end
end
