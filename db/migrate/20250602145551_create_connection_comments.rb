class CreateConnectionComments < ActiveRecord::Migration[7.1]
  def change
    create_table :connection_comments do |t|
      t.references :connection, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
