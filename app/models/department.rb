class Department < ActiveRecord::Base
	has_many :offices, dependent: :nullify
end
