class WatchlistsController < ApplicationController
  def index
    @movies = Movie.all
    @watchlist = Watchlist.where(user: current_user).first
    @movie_marks = MovieMark.where(watchlist: @watchlist)
  end
end
