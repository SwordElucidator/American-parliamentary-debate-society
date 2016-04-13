class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :slots
  has_many :debates, through: :slots
  validate :have_invitation_code
  
  def have_invitation_code
    if Invitation.find_by_code(:code) == nil
      errors.add(:code)
    end
  end
end
