# class UsersController < ApplicationController
  
  
#     def login
#       if (params[:username])
#         @customer = params[:username]
#         if (SignUser.find_by_username(@customer))
#           puts "The username does exist"
#           puts params[:username]
#           puts @customer
#           if (SignUser.find_by_username(@customer).password != params[:password])
#             #puts "The username doesn't match the password"
#             #flash[:notice] = "The username doesn't match the password"
#           else
#             redirect_to customer_path(SignUser.find_by_username(@customer).id)
#           end
          
#         else
#           puts "The username doesn't exist"
#           flash[:notice] = "The username doesn't exist"
#         end
#       else
#       end
#     end 
     
   
      
    
#     def homepage
#       @id = params[:id]
#       puts "the id is"
#       puts @id
#       @username = SignUser.find_by_id(@id).username
#     end
    
#     def signup
#       if (params[:username])
#         @user = SignUser.create!(user_params)
#         flash[:notice] = "#{@user.username} was successfully created."
#         redirect_to login_path
#       else
#         puts "signup world"
#       end
#     end
   
   
#   private
#     def user_params
#       params.permit(:username, :password)
#     end
# end
