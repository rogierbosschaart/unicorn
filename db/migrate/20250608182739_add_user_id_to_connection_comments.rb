class AddUserIdToConnectionComments < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_comments, :user_id, :bigint
    add_index :connection_comments, :user_id
  end
end
