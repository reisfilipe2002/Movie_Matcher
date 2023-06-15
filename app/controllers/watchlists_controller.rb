class WatchlistsController < ApplicationController
  def index
    @movies = Movie.all
    @watchlist = Watchlist.where(user: current_user).first
    @recommendations = @watchlist.recommendations
  end
end
