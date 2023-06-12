class CreateMovieMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_marks do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :watchlist, foreign_key: true

      t.timestamps
    end
  end
end
