class AddSeenToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :seen, :boolean, default: false
  end
end
