class Review < ActiveRecord::Base
	belongs_to :professor
	belongs_to :user
	validates_presence_of :rating, :classname, :comment
end
