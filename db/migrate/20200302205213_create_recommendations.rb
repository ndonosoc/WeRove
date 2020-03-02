class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.string :description
      t.string :location
      t.string :price_range
      t.string :duration
      t.string :reservation

      t.timestamps
    end
  end
end
