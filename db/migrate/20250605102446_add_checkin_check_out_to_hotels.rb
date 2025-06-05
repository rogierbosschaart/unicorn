class AddCheckinCheckOutToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :checkin, :date
    add_column :hotels, :checkout, :date
  end
end
