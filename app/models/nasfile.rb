class Nasfile < ActiveRecord::Base
  belongs_to :category
  has_many :trackers, dependent: :destroy
  #has_many :received_files,:class_name => 'Tracker', :foreign_key => 'office_sent_to_id'
  has_many :offices, :through => :received_files

  

  before_save :file_full_number, :on => [:create, :update] 
	def file_full_number
		if self.file_sub.present?
			self.file_number = [self.file_number , self.file_sub].join('/')
		else
			self.file_number = self.file_number
		end
	end
end
