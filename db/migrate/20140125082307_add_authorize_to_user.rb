class AddAuthorizeToUser < ActiveRecord::Migration
  def change
    add_column :users, :authorize, :boolean
  end
end
