class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :slottype
      t.string :status
      t.datetime :time

      t.timestamps null: false
    end
  end
end
