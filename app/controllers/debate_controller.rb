class DebateController < ApplicationController
    def index
       if params[:value] == "register"
          if checkregister(params[:debateid]) == false
            puts "hello world"
          else
            register(params[:id])
          end
       elsif params[:value] == "cancel"
          cancel(params[:id])
       end
       @debate = Debate.all
    end
    
    def create
        if params[:topic] and params[:location] and params[:time]
          newdebate = Debate.create(:location => params[:location], :time => params[:time], :topic => params[:topic])
          puts "new debate has been successfully created"
          newdebate.slots.create(:slottype => "government", :time => params[:time], :status => "empty")
          newdebate.slots.create(:slottype => "government", :time => params[:time], :status => "empty")
          newdebate.slots.create(:slottype => "opposition", :time => params[:time], :status => "empty")
          newdebate.slots.create(:slottype => "opposition", :time => params[:time], :status => "empty")
          newdebate.slots.create(:slottype => "judge", :time => params[:time], :status => "empty")
          newdebate.slots.create(:slottype => "judge", :time => params[:time], :status => "empty")
          puts "new slots have been successfully created"
          redirect_to action: "index"
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
        
    def register(slotid)
        registeredslot = Slot.find_by_id(slotid) 
        registeredslot.update(:status => "full")
        puts "hello register"
        current_user.slots.concat(registeredslot)
        current_user.save
    end
    
    def cancel(slotid)
        registeredslot = Slot.find_by_id(slotid)
        registeredslot.update(:status => "empty")
        puts "hello cancel"
        current_user.slots.delete(registeredslot)
        current_user.save
    end
end