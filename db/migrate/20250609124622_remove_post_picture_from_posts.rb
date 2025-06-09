class RemovePostPictureFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :post_picture, :string
  end
end
