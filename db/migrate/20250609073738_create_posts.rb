class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :agency, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :post_text

      t.timestamps
    end
  end
end
