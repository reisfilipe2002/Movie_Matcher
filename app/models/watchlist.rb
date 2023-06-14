class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :recommendations, through: :user
end
