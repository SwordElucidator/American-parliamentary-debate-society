class AddTimeToDebate < ActiveRecord::Migration
  def change
    add_column :debates, :time, :string
  end
end
