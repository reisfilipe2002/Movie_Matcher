class Movie < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title],
    using: {
      tsearch: { prefix: true }
    }
end
