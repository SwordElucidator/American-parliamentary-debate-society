class ProfileController < ApplicationController
    before_action :authenticate_user!
    
    def profile
        data = params[:user]
        if not data
            render 'profile'
        else
            firstname = data[:firstname]
            lastname = data[:lastname]
            major = data[:major]
            if firstname and firstname != ""
                current_user.firstname = firstname
            end
            if lastname and lastname != ""
                current_user.lastname = lastname
            end
            if major and major != ""
                current_user.major = major
            end
            current_user.save
            render 'profile'
        end
    end

end
