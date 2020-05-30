class AddAuthColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :hashed_password, :string, null: false
  end
end
