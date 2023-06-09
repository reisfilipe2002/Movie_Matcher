class ProfilesController < ApplicationController
  def choose_favorite_movies
    @movies = Movie.all.limit(10)
    @movies_id_tmdb = @movies.each do |movie|
      @movie_id_tmdb = Tmdb::Movie.find(movie.title.split)
      # @posters_path = Tmdb::Movie.images(@movie_id_tmdb[0].id)["posters"].each do |poster|
      #   @poster_path = poster["file_path"]
      # end
    end
    raise
    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end
    @favourite_movie = FavouriteMovie.new
    @favourite_movies = FavouriteMovie.where(user_id: current_user.id)
  end
end
