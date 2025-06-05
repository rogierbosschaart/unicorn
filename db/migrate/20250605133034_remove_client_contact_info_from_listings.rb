class RemoveClientContactInfoFromListings < ActiveRecord::Migration[7.1]
  def change
    remove_column :listings, :client_contact_info, :string
  end
end
