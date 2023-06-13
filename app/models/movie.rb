class Movie < ApplicationRecord
  has_many :watchlists, through: :movie_marks
  belongs_to :movie_mark, optional: true
  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title],
    using: {
      tsearch: { prefix: true }
    }
end
