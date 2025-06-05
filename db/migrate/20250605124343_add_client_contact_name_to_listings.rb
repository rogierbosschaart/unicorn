class AddClientContactNameToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :client_contact_name, :string
  end
end
