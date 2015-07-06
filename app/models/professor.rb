class Professor < ActiveRecord::Base
	searchkick
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, :styles => { :medium => "400x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	validates_presence_of :name, :title, :department

  	# def self.search(search)
  	# 	if search
  	# 		where("name = ? OR department = ?", search, search)
  	# 	else
  	# 		find(:all)
  	# 	end
  	# end
end
