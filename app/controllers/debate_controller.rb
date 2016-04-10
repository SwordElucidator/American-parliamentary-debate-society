class DebateController < ApplicationController
    def index
        @current_debate = Debate.find_current_debates
        @past_debate = Debate.find_past_debates
        @slottype = ["government", "opposition", "judge"]
        if params[:value] == "register"
            if checkregister(params[:debateid]) == false
               flash.delete :success if flash[:success]
               flash.now[:error] = "You cannot play two roles in the same debate"
            else
               changeRegistration(params[:id], params[:debateid], params[:value], "full")
            end
        elsif params[:value] == "cancel"
            changeRegistration(params[:id], params[:debateid], params[:value], "empty")
        end
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
                flash.now[:error] = "Invalid format of debate...Please Try Again"
            end
        end
    end
    
    def update
        if params[:delete]
            puts "delete this debate"
            debate = Debate.find_by_id(params[:id])
            current_user.slots.delete(debate.slots)
            Slot.delete(debate.slots)
            Debate.delete(params[:id])
            redirect_to action: "index"
        end
        if params[:topic] and params[:location] and params[:time]
            Debate.find_by_id(params[:id]).update(:location => params[:location], :time => params[:time], :topic => params[:topic])
            redirect_to action: "index"
        end
    end
    
    
    private
    
    def checkregister(debateid)
        debateslots = Debate.find_by_id(debateid).slots
        current_user.slots.each do |userslot|
            if debateslots.include?userslot
                return false
            end
        end
        return true
    end
    
    
    def changeRegistration(slotid, debateid, move, status)
        registeredslot = Slot.find_by_id(slotid)
        registeredslot.update(:status => status) 
        current_user.slots.concat(registeredslot) if move == "register"
        current_user.slots.delete(registeredslot) if move == "cancel"
        current_user.save
        flash.delete :error if flash[:error]
        flash.now[:success] = "You have successfully " + move + " the debate " + '"' + Debate.find_by_id(debateid).topic + '"'
    end
         
             
             
        
end