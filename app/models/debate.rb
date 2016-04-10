class Debate < ActiveRecord::Base
    has_many :slots, :dependent => :destroy
    has_many :users, through: :slots
    #attr_accessible :topic, :time, :location
    validates :topic, :time, :location, :presence => true
    
end
