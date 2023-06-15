class ProfilesController < ApplicationController
  def choose_favorite_movies
    @movies = Movie.all.limit(10)
    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end
    @favourite_movie = FavouriteMovie.new
    @favourite_movies = FavouriteMovie.where(user_id: current_user.id)
  end

  def show
  end

  def destroy
    current_user.destroy
    redirect_to root_path, notice: 'Profile successfully deleted.'
  end
end
