class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
