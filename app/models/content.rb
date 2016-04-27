class Content < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :heading_image1, AvatarUploader
  mount_uploader :heading_image2, AvatarUploader
  mount_uploader :heading_image3, AvatarUploader
  mount_uploader :heading_image4, AvatarUploader
end
