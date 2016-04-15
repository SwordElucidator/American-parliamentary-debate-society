class RemoveTimeFromDebate < ActiveRecord::Migration
  def change
    remove_column :debates, :time, :datetime
  end
end
