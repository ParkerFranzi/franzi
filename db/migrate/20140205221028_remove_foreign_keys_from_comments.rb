class RemoveForeignKeysFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :user_id
    remove_column :comments, :post_id
    remove_column :comments, :gallery_id
  end

  def down
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
    add_column :comments, :gallery_id, :integer
  end
end
