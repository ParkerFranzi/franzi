class RemoveAuthorizeFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :authorize
  end

  def down
    add_column :users, :authorize, :boolean
  end
end
