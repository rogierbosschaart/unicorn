class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.boolean :opened
      t.boolean :attended_casting
      t.boolean :accepted_option
      t.boolean :busy_casting
      t.integer :rate

      t.timestamps
    end
  end
end
