class AddEditContent < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :heading_title
      t.text :heading_content
      t.string :heading_image_url
      t.string :about_title
      t.text :about_content
      t.string :announcements_heading
      t.text :announcements_content
    __END__
  end
end
