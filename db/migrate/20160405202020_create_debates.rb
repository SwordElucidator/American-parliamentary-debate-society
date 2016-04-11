class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :topic
      t.string :location
      t.datetime :time

      t.timestamps null: false
    end
  end
end
