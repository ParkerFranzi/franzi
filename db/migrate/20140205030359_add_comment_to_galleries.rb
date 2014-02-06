class AddCommentToGalleries < ActiveRecord::Migration
  def change
    add_column :comments, :gallery_id, :integer
    add_index :comments, :gallery_id
  end
end
