class AddTimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :time, :datetime
  end
end
