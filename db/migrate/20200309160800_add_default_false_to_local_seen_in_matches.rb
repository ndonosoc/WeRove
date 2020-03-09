class AddDefaultFalseToLocalSeenInMatches < ActiveRecord::Migration[5.2]
  def change
    change_column_default :matches, :local_seen, false
  end
end
