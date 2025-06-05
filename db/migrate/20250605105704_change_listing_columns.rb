class ChangeListingColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :listings, :start_date, :date
    change_column :listings, :end_date, :date
    add_column :listings, :start_time, :time
    add_column :listings, :end_time, :time
  end
end
