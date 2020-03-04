class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :match, foreign_key: true
      t.integer :rating
      t.bigint :rated_id, foreign_key: true
      t.bigint :rater_id, foreign_key: true

      t.timestamps
    end
  end
end
