class Debate < ActiveRecord::Base
    has_many :slots, :dependent => :destroy
    has_many :users, through: :slots
    #attr_accessible :topic, :time, :location
    validates :topic, :time, :location, :presence => true
    
    
    def self.find_current_debates
       return Debate.where("time > ?", Time.now)
    end
    
    def self.find_past_debates
       return Debate.where("time < ?", Time.now) 
    end
    
    def self.parse_name(user)
        first_name = user.firstname[0, 10]
        last_initial = user.lastname[0] + "."
        return last_initial + first_name
    end
end
