class RemoveClientNameFromListings < ActiveRecord::Migration[7.1]
  def change
    remove_column :listings, :client_name, :string
  end
end
