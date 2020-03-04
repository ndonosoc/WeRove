class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :match, foreign_key: true
      t.bigint :messager_id, foreign_key: true

      t.timestamps
    end
  end
end
