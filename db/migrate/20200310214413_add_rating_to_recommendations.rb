class AddRatingToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :rating, :integer
  end
end
