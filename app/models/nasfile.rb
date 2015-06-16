class Nasfile < ActiveRecord::Base
  belongs_to :category
  has_many :trackers, dependent: :destroy
  

  before_save :file_full_number, :on => [:create, :update] 
	def file_full_number
		if self.file_sub.present?
			self.file_number = [self.file_number , self.file_sub].join('/')
		else
			self.file_number = self.file_number
		end
	end
end
