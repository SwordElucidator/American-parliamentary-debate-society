class AddImageUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string, :default => "http://www.aaea.com.ar/img/user.png"
  end
end
