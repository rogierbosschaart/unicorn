class AddPostPictureToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :post_picture, :string
  end
end
