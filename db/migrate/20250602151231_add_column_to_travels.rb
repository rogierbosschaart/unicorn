class AddColumnToTravels < ActiveRecord::Migration[7.1]
  def change
    add_column :travels, :extra_info, :text
  end
end
