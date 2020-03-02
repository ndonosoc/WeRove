class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :local
      t.references :tourist
      t.boolean :available
      t.boolean :accepted

      t.timestamps
    end
  end
end
