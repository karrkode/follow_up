class Upload < ApplicationRecord
	belongs_to :uploader, class_name: 'User'
	belongs_to :affiliate, class_name: 'Organization', foreign_key:'affiliate_id'


	def generateTerf(file,affiliate_id)
		binding.pry
	end
end
