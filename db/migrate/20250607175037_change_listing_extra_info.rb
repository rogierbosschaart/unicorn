class ChangeListingExtraInfo < ActiveRecord::Migration[7.1]
  def change
    change_column :listings, :extra_info, :text
  end
end
