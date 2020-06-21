class Author < ActiveRecord::Base
	validates :name, presence: true, uniqueness: {case_sensitive: true}
	validates :phone_number, length: {is: 10}
end
