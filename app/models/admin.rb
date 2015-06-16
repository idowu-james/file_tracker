class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable,
  		 :authentication_keys => [:username], password_length: 6..25

  		def email_required?
   			 false
  		end

  		def email_changed?
    		false
  		end

end
