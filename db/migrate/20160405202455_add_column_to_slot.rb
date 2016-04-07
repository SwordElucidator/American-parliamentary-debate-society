class AddColumnToSlot < ActiveRecord::Migration
  def change
    add_column :slots, :user_id, :integer
    add_column :slots, :debate_id, :integer
  end
end
