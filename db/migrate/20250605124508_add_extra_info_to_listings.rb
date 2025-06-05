class AddExtraInfoToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :extra_info, :string
  end
end
