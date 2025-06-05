class ChangeTravelTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :travels, :date_time
    add_column :travels, :date, :date
    add_column :travels, :time, :time
  end
end
