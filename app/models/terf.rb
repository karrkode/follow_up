class Terf < ApplicationRecord

	belongs_to :owner, class_name:'User'
	belongs_to :organization

end
