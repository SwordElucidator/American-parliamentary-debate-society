class Content < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :heading_image1, AvatarUploader
  mount_uploader :heading_image2, AvatarUploader
  mount_uploader :heading_image3, AvatarUploader
  mount_uploader :heading_image4, AvatarUploader
  mount_uploader :leader_image1, AvatarUploader
  mount_uploader :leader_image2, AvatarUploader
  mount_uploader :leader_image3, AvatarUploader
  mount_uploader :leader_image4, AvatarUploader
  mount_uploader :leader_image5, AvatarUploader
  mount_uploader :leader_image6, AvatarUploader
end
