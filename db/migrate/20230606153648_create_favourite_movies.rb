class CreateFavouriteMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_movies do |t|

      t.timestamps
    end
  end
end
