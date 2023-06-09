class AddUserRefToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_reference :recommendations, :user, null: false, foreign_key: true
  end
end
