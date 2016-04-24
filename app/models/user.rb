class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :slots
  has_many :debates, through: :slots
  validate :have_invitation_code, :on => :create
  
  require 'carrierwave/orm/activerecord'
  mount_uploader :image_url, AvatarUploader
  
  def have_invitation_code
    if Invitation.find_by_code(code) == nil
      errors.add(:code, "Inalid code")
    else
      # match?
      require 'digest/sha1'
      if code != Digest::SHA1.hexdigest(email)
        errors.add(:code, "code does not match email")
      else
        #clear database
        Invitation.find_by_code(code).delete()
      end
    end
  end
end
