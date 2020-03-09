class AddDefaultToLocalSeenInMatches < ActiveRecord::Migration[5.2]
  def change
    change_column_default :matches, :local_seen, true
  end
end
