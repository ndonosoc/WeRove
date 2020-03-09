class ChangeSeenToMatches < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :seen, :tourist_seen
    add_column :matches, :local_seen, :boolean
  end
end
