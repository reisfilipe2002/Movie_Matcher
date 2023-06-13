class MovieMark < ApplicationRecord
  belongs_to :movie
  belongs_to :watchlist, optional: true
end
