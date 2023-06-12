class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :movies, through: :movie_marks
  has_many :movie_marks
end
