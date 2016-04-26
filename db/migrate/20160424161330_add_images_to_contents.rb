class AddImagesToContents < ActiveRecord::Migration
  def change
    add_column :contents, :heading_image1, :string
    add_column :contents, :heading_image2, :string
    add_column :contents, :heading_image3, :string
    add_column :contents, :heading_image4, :string
  end
end
