class Tracker < ActiveRecord::Base
  belongs_to :nasfile

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :receiver, :foreign_key => :receiver_id, class_name: 'User'
  belongs_to :office_receiving, :foreign_key => :office_sent_to_id, class_name: 'Office'
  belongs_to :office_sending, :foreign_key => :office_sent_from_id, class_name: 'Office'

  scope :newest_first, lambda { order("trackers.created_at DESC")}



  before_save :office_sent_to, :on => [:create, :update] 
  #after_save :office_sent_from, :on => [:create, :update]
  after_create :set_nasfile_office_id
	def office_sent_to		
		self.office_sent_to_id = self.receiver.office.id		
	end

	def office_sent_from
		self.office_sent_from_id = self.sender.office.id
	end

def set_nasfile_office_id
    # child should always have a parent, but we need to check just in case
    nasfile.update_column(:office_id, nasfile.trackers.last.office_sent_to_id ) unless nasfile.nil?
  end

  def self.all_without(excluded)
    where("id NOT IN (?)", excluded)
  end

  # def self.all_without_office(excluded)
  #     where("id NOT IN (?)", excluded)
  # end
end
