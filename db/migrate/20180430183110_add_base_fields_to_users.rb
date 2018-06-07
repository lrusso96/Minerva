class AddBaseFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birthdate, :date
    add_column :users, :nickname, :string
    add_column :users, :country, :string
    add_column :users, :website, :string
  end
end
