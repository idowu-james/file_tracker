class Tracker < ActiveRecord::Base
  belongs_to :nasfile

  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :receiver, :foreign_key => :receiver_id, class_name: 'User'
  belongs_to :office_receiving, :foreign_key => :office_sent_to_id, class_name: 'Office'
  belongs_to :office_sending, :foreign_key => :office_sent_from_id, class_name: 'Office'


  before_save :office_sent_to, :on => [:create, :update] 
  #after_save :office_sent_from, :on => [:create, :update]
	def office_sent_to		
		self.office_sent_to_id = self.receiver.office.id		
	end

	def office_sent_from
		self.office_sent_from_id = self.sender.office.id
	end
  
end
