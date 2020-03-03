class ChangeLanguagesDefaultInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :languages, nil)
  end
end
