class InvitationController < ApplicationController
    def index
      if params[:email]
          emails = params[:email]
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