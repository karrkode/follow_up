class Terf < ApplicationRecord

	belongs_to :owner, class_name:'User'
	belongs_to :organization
	has_many :terf_entries

end
