class EditSchema < ActiveRecord::Migration[7.1]
  def change
    add_reference :connections, :agency, foreign_key: true
  end
end
