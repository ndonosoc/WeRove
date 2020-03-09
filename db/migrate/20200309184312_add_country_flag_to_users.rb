class AddCountryFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country_flag, :string
  end
end
