class User < ActiveRecord::Base
  #belongs_to :office
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :authentication_keys => [:username], password_length: 6..25

  belongs_to :office
  accepts_nested_attributes_for :office

  has_many :sent_files,:class_name => 'Tracker', :foreign_key => 'sender_id'
  has_many :received_files,:class_name => 'Tracker', :foreign_key => 'recepient_id'

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.all_without(excluded)
    where("id NOT IN (?)", excluded)
  end

end
