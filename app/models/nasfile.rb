class Nasfile < ActiveRecord::Base
  belongs_to :category
  belongs_to :office
  has_many :trackers, dependent: :destroy
  has_many :received_files,:class_name => 'Tracker', :foreign_key => 'office_sent_to_id'
  has_many :offices, :through => :received_files

  

  before_save :file_full_number, :on => [:create, :update] 
	def file_full_number
		if self.file_sub.present?
			self.file_number = [self.file_number , self.file_sub].join('/')
		else
			self.file_number = self.file_number
		end
	end

	def self.all_files_in_office(included)
	    where("office_id IN (?)", included)
	end

	def self.last_leaving_office(included)
	    where("office_sending.name.downcase = ?", included)
	end
end
