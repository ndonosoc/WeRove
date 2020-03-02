class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :score, :integer
    add_column :users, :verified, :boolean
    add_column :users, :biography, :string
    add_column :users, :available, :boolean
    add_column :users, :languages, :string
    add_column :users, :occupation, :string
  end
end
