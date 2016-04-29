class AddLeadersToContent < ActiveRecord::Migration
  def change
    add_column :contents, :leader_name1, :string, :default => "Leader1"
    add_column :contents, :leader_sub1, :string, :default => "Sub1"
    add_column :contents, :leader_image1, :string
    add_column :contents, :leader_name2, :string, :default => "Leader2"
    add_column :contents, :leader_sub2, :string, :default => "Sub2"
    add_column :contents, :leader_image2, :string
    add_column :contents, :leader_name3, :string, :default => "Leader3"
    add_column :contents, :leader_sub3, :string, :default => "Sub3"
    add_column :contents, :leader_image3, :string
    add_column :contents, :leader_name4, :string, :default => "Leader4"
    add_column :contents, :leader_sub4, :string, :default => "Sub4"
    add_column :contents, :leader_image4, :string
    add_column :contents, :leader_name5, :string, :default => "Leader5"
    add_column :contents, :leader_sub5, :string, :default => "Sub5"
    add_column :contents, :leader_image5, :string
    add_column :contents, :leader_name6, :string, :default => "Leader6"
    add_column :contents, :leader_sub6, :string, :default => "Sub6"
    add_column :contents, :leader_image6, :string
  end
end
