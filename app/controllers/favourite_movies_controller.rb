class FavouriteMoviesController < ApplicationController
  def index
    @favourite_movies = FavouriteMovie.where(user_id: current_user.id)
  end

  def show
    @favourite_movie = FavouriteMovie.find(params[:id])
  end

  def new
    @favourite_movie = FavouriteMovie.new
  end

  def create
    @favourite_movie = favouriteMovie.new(favourite_movie_params)
    if @favourite_movie.save
      redirect_to @favourite_movie, notice: 'favourite movie was successfully created.'
    else
      render :new
    end
  end

  def edit
    @favourite_movie = FavouriteMovie.find(params[:id])
  end

  def update
    @favourite_movie = FavouriteMovie.find(params[:id])
    if @favourite_movie.update(favourite_movie_params)
      redirect_to @favourite_movie, notice: 'favourite movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @favourite_movie = favouriteMovie.find(params[:id])
    @favourite_movie.destroy
    redirect_to favourite_movies_url, notice: 'favourite movie was successfully destroyed.'
  end

  private

  def favourite_movie_params
    params.require(:favourite_movie).permit(:title, :description, :user_id)
  end
end
