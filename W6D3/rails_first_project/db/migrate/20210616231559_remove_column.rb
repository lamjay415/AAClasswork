class RemoveColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :name
    remove_column :users, :email
  end 
end
