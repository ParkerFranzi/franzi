class MakeCommentsPolymorphic < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end

  def down
    remove_column :comments, :commentable_id, :integer
    remove_column :comments, :commentable_type, :string
  end
end
