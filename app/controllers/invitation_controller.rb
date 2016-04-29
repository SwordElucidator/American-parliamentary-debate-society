class InvitationController < ApplicationController
    before_action :authentication_precheck
    def authentication_precheck
        if !user_signed_in?
          flash[:notice] = "you should log in first to see the mockdebate page"
          redirect_to new_user_session_path
        else
          if current_user.is_admin != true
            redirect_to root_path
          end
        end
        flash.delete :notice if flash[:notice]
    end
    
    def index
      if params[:email]
          emails = params[:email].strip()
          message = email_format_check(emails)
          if message != ""
            flash[:notice] = message 
          else
            emailList = emails.split(/[\s,]+/)
            for email in emailList
              UserMailer.send_invitation(email).deliver
              flash[:notice] = "Invitation code has been successfully generated and sent to the email address(es) you enter"
            end
          end
      end
    end
    
    private
    def email_format_check(email)
      illegal_format = ""
      emailList = email.split(/[\s,]+/)
      for email in emailList
        if email !~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
          illegal_format = illegal_format + email + " "
        end
      end
      if illegal_format != ""
        illegal_format = illegal_format + "doesn't match the email format xxxxx@xxxxx.xxx"
      end
      return illegal_format
    end
end