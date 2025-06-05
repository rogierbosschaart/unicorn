class AddClientContactInfoToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :client_contact_info, :string
  end
end
