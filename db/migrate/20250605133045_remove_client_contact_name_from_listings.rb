class RemoveClientContactNameFromListings < ActiveRecord::Migration[7.1]
  def change
    remove_column :listings, :client_contact_name, :string
  end
end
