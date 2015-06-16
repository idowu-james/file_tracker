class Office < ActiveRecord::Base
  belongs_to :department

  has_many :users
  #has_many :trackers, :through => :users
  has_many :received_files,:class_name => 'Tracker', :foreign_key => 'office_sent_to_id'


  def self.all_without(excluded)
    where("id NOT IN (?)", excluded)
  end
end
