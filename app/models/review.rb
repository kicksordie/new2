class Review < ActiveRecord::Base
	belongs_to :professor
	belongs_to :user
	paginates_per 10
	validates_presence_of :rating, :classname, :comment
end
