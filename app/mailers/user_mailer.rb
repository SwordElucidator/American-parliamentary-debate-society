class UserMailer < ApplicationMailer
  default from: 'acjwxc12138@126.com'
 
  def send_invitation(email)
    #@url  = 'http://example.com/login'
    require 'digest/sha1'
    @code = Digest::SHA1.hexdigest(email)
    Invitation.create(:code => @code)
    mail(to: email, subject: 'Welcome to the American Parliamentary Debate Society of Berkeley')
  end
end
