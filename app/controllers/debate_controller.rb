class DebateController < ApplicationController
    before_action :authentication_precheck
    
    def authentication_precheck
      if !user_signed_in?
        flash[:notice] = "you should log in first to see the mockdebate page"
        redirect_to new_user_session_path
      end
    end
    
    
    def index
        if params[:id]
            if checkprofile
                slotid = params[:id]
                registeredslot = Slot.find_by_id(slotid)
                debateid = registeredslot.debate_id
                if registeredslot.status == "empty"
                    if checkregister(debateid)
                        register(registeredslot)
                    end
                else
                    cancel(registeredslot)
                end
            end
        end
        @slottype = ["government", "opposition", "judge"]
        @debate = Debate.all
    end
    
    
    def create
        if params[:topic] and params[:location] and params[:time]
            newdebate = Debate.create(:location => params[:location], :time => params[:time], :topic => params[:topic])
            if newdebate.save
                ["government", "opposition", "judge"].each do |create|
                   newdebate.slots.create(:slottype => create, :time => params[:time], :status => "empty")
                   newdebate.slots.create(:slottype => create, :time => params[:time], :status => "empty")
                end
                redirect_to action: "index"
            else
                flash.now[:error] = "Please make sure no field is empty"
            end
        end
    end
    
    def update
        if params[:delete]
            puts "delete this debate"
            debate = Debate.find_by_id(params[:id])
            Slot.delete(debate.slots)
            Debate.delete(params[:id])
            redirect_to action: "index"
        end
        if params[:topic] and params[:location] and params[:time]
            modify_debate = Debate.find_by_id(params[:id]).update(:topic => params[:topic], :location => params[:location], :time => params[:time])
            if modify_debate == true
              redirect_to action: "index"
            else
              flash.now[:error] = "Please make sure no field is empty"
            end
        end
    end
    
    
    private
    
    
    def checkregister(debateid)
        debateslots = Debate.find_by_id(debateid).slots
        current_user.slots.each do |userslot|
            if debateslots.include?userslot
                flash.now[:error] = "You have already registered a slot for this debate"
                return false
            end
        end
        return true
    end
    
    def checkprofile
        if current_user.lastname != nil and current_user.firstname != nil
            return true
        end
        flash.now[:error] = "You need to edit your profile first to sign up the mockdebate"
        return true
    end
    
    def register(registeredslot)
        registeredslot.update(:status => "full")
        current_user.slots.concat(registeredslot)
        current_user.save
        flash.now[:success] = "You have successfully register the debate"
    end
    
    def cancel(registeredslot)
        registeredslot.update(:status => "empty")
        current_user.slots.delete(registeredslot)
        current_user.save
        flash.now[:success] = "You have successfully cancel the debate"
    end
    
    
end
