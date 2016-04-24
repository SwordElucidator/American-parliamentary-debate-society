class Debate < ActiveRecord::Base
    has_many :slots, :dependent => :destroy
    has_many :users, through: :slots
    validate :debate_input_correct
    
    
    def debate_input_correct
        if !time.empty? and !topic.empty? and !location.empty?
            if Debate.parse_time(time).to_i + 7 * 60 * 60 - Time.now.to_i < 0
               errors.add(:time, "outdated time")
            end
        else
            errors.add(:time, "empty field")
        end
    end
    
    def self.parse_name(user)
        first_name = user.firstname[0, 10]
        last_initial = user.lastname[0] + "."
        return last_initial + first_name
    end
    
    def self.parse_time(str_time)
        array1 = str_time.split("/")
        month = array1[0].to_i
        day = array1[1].to_i
        array2 = array1[2].split(" ")
        year = array2[0].to_i
        array3 = array2[1].split(":")
        if array2[2] == "PM"
            hour = array3[0].to_i + 12 
        else
            hour = array3[0].to_i
        end
        minute = array3[1]
        parsed_time = Time.new(year, month, day, hour, minute)
        return parsed_time
    end
    
    def self.find_past_debates(debates)
        past_debates = Array.new
        debates.each do |debate|
            if Debate.parse_time(debate.time).to_i + 7 * 60 * 60 - Time.now.to_i < 0
                past_debates.push(debate)
            end
        end
        return past_debates
    end
    
    def self.find_future_debates(debates)
        future_debates = Array.new
        debates.each do |debate|
            if Debate.parse_time(debate.time).to_i + 7 * 60 * 60 - Time.now.to_i >= 0
                future_debates.push(debate)
            end
        end
        return future_debates
    end
end
