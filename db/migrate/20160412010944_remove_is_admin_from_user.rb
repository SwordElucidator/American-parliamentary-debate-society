class RemoveIsAdminFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_admin, :string
    remove_column :users, :boolean, :string
  end
end
