class AddProfilePics < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_pic, :string, null: true, default: nil
    add_column :agencies, :profile_pic, :string, null: true, default: nil
  end
end
