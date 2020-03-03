class ChangeLanguagesInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :languages, :text, array: true, using: "(string_to_array(languages, ','))"
  end
end
