class WatchlistsController < ApplicationController
  def index
    @movies = Movie.all
    @recommendations = Recommendation.where(user: current_user)
    @movies = []
    @recommendations.each do |recommendation|
      movie_results = Tmdb::Movie.search(recommendation.title)
      movie_id_tmdb = movie_results.first.id
      posters = Tmdb::Movie.images(movie_id_tmdb, language: 'en-US')["posters"]
        @movies << {
          title: recommendation.title,
          poster_url: "https://image.tmdb.org/t/p/original#{posters.first['file_path']}",
          id: recommendation.id
        }
    end
    @watchlist = Watchlist.where(user: current_user).first
  end
end
