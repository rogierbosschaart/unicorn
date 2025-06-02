class AddTablesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_type, :string
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :username, :string
  end
end
