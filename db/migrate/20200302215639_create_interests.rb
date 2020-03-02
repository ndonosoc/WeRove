class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :title
      t.bigint :parent_id, foreign_key: true

      t.timestamps
    end
  end
end
