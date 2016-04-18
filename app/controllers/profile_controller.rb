class ProfileController < ApplicationController
    before_action :authenticate_user!
    
    def profile
        data = params[:user]
        @user_to_see = current_user
        if not data
            render 'profile'
        else
            firstname = data[:firstname]
            lastname = data[:lastname]
            major = data[:major]
            image_url = data[:image_url]
            if firstname and firstname != ""
                current_user.firstname = firstname
            end
            if lastname and lastname != ""
                current_user.lastname = lastname
            end
            if major and major != ""
                current_user.major = major
            end
            if image_url and image_url != ""
                current_user.image_url = image_url
            end
            current_user.save
            render 'profile'
        end
    end
    
    def user
        id = params[:id]
        @user_to_see = User.find_by_id(id)
        render 'profile'
    end

end
