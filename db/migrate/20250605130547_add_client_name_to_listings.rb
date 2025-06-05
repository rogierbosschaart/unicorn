class AddClientNameToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :client_name, :string
  end
end
