class AddTitleToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :title, :string
  end
end
