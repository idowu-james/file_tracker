class Category < ActiveRecord::Base

	scope :sorted , lambda { order("categories.name ASC") }
end
