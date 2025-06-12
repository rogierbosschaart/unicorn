class AddBooleanToConnectionComments < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_comments, :read, :boolean, default: false
  end
end
