class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.text :contact_info

      t.timestamps
    end
  end
end
