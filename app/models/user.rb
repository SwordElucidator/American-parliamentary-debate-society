class User < ActiveRecord::Base
    validates :username, :presence => true
    validate :username_format
    def username_format
       if  !username =~ /a-zA-Z0-9/
           puts "not letters"
           errors.add(:username, 'needs to be letters or numbers')
       elsif username.length >= 10
           errors.add(:username, 'should not be longer than 10 characters')
           puts "exceed maximum length"
       elsif User.find_by_username(username)
           errors.add(:username, 'has already been registered')
       else
           puts "username correct"
       end
    end
end
