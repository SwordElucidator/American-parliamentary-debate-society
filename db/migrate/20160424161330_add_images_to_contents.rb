class AddImagesToContents < ActiveRecord::Migration
  def change
    add_column :contents, :heading_image1, :string
    add_column :contents, :heading_image2, :string
    add_column :contents, :heading_image3, :string
    add_column :contents, :heading_image4, :string
    add_column :contents, :officer_image1, :string
    add_column :contents, :officer_image2, :string
    add_column :contents, :officer_image3, :string
    add_column :contents, :officer_image4, :string
    add_column :contents, :officer_image5, :string
    add_column :contents, :officer_image6, :string
  end
end
