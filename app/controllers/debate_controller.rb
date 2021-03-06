class DebateController < ApplicationController
    before_action :authentication_precheck
    before_action :check_admin, only: [:create, :update]
    before_action :check_item_exist, only: [:update]
    
    def authentication_precheck
        if !user_signed_in?
            flash[:notice] = "You should log in first to see this page."
            redirect_to new_user_session_path
        end
    end
    
    def check_admin
        if !current_user.is_admin
            redirect_to mockdebate_path
        end
    end
    
    def check_item_exist
        if Debate.find_by_id(params[:id]) == nil
            redirect_to mockdebate_path
        end
    end    
    
    def index
        @empty = "no search"
        @slottype = ["government", "opposition", "judge"]
        if params[:search]
          filteredebate = Debate.filter_by_title(params[:search])
          if filteredebate.empty?
            @empty = "No Results Found" 
          end
          debate = Debate.find_future_debates(filteredebate)
        else
          debate = Debate.find_future_debates(Debate.all) 
        end
        debate.map{|i| i.id}
        @debate = Debate.where(:id => debate).paginate(:page => params[:page], per_page: 8)

        # respond_to do |format|
        #         format.html
        #         format.js
        # end
    end
    
    def registerdebate
        if params[:value]  and params[:id] and params[:debateid]
            slotid = params[:id]
            @slotid = params[:id]
            @debateid = params[:debateid]
            registeredslot = Slot.find_by_id(slotid)
            if checkprofile
                if checkregister(@debateid)
                    if checktime(@debateid)
                       register(registeredslot)
                       @error = "nonerror"
                    else
                       @error = "timeConflictError"
                    end
                else
                   @error = "registerConflictError"
                end
            else
                @error = "profileEmptyError"
            end
            respond_to do |format|
                format.html
                format.js
            end
        end
    end
    

    def canceldebate
        if params[:value]  and params[:id] and params[:debateid]
            slotid = params[:id]
            @slotid = params[:id]
            @debateid = params[:debateid]
            registeredslot = Slot.find_by_id(slotid)
            if checkprofile
                cancel(registeredslot)
                @error1 = "nonerror"
            else
                @error1 = "profileEmptyError"
            end
            respond_to do |format|
                format.html
                format.js
            end
        end
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
                newdebate.errors.full_messages.each do |error|
                    if error == "Time empty field"
                      flash.now[:error] = "Please make sure no field is empty"
                    elsif error == "Time outdated time"
                      flash.now[:error] = "The scheduled debate time falls behind the current time"
                    end
                end
            end
        end
    end
    
    def update
        if params[:delete]
            debate = Debate.find_by_id(params[:id])
            Slot.delete(debate.slots)
            Debate.delete(params[:id])
            redirect_to action: "index"
        end
        if params[:topic] and params[:location] and params[:time]
            modify_debate = Debate.find_by_id(params[:id]).update(:topic => params[:topic], :location => params[:location], :time => params[:time])
            if modify_debate
                redirect_to action: "index"
            else
                flash.now[:error] = "Please make sure no field is empty and the debate time doesn't fall behind current time"
            end
        end
    end
    
    
    private
    
    def checktime(debateid)
        debate = Debate.find_by_id(debateid)
        if current_user.debates != nil and current_user.debates.find_by_time(debate.time)
            flash.delete :success if flash[:success]
            flash.now[:error] = "You cannot register this debate since it has a time conflict with your registered debate"
            return false
        else
            return true
        end
    end
    
    def checkregister(debateid)
        debateslots = Debate.find_by_id(debateid).slots
        current_user.slots.each do |userslot|
            if debateslots.include?userslot
                flash.delete :success if flash[:success]
                flash.now[:error] = "You have already registered for this debate!"
                return false
            end
        end
        return true
    end
    
    def checkprofile
        if current_user.lastname != nil and current_user.firstname != nil
            return true
        end
        flash.delete :success if flash[:success]
        flash.now[:error] = "You need to edit your profile first to sign up for a debate."
        return false
    end
    
    def register(registeredslot)
        registeredslot.update(:status => "full")
        current_user.slots.concat(registeredslot)
        current_user.save
        flash.delete :error if flash[:error]
        flash.now[:success] = "You have successfully registered for this debate!"
    end
    
    def cancel(registeredslot)
        registeredslot.update(:status => "empty")
        current_user.slots.delete(registeredslot)
        current_user.save
        flash.delete :error if flash[:error]
        flash.now[:success] = "You have successfully cancelled your role in this debate."
    end
    
    
end
