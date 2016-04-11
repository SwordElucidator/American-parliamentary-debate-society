class Debate < ActiveRecord::Base
    has_many :slots, :dependent => :destroy
    has_many :users, through: :slots
end
