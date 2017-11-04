class Upload < ApplicationRecord
	belongs_to :uploader, class_name: 'User'
	belongs_to :affiliation, class_name: 'Organization', foreign_key:'affiliate_id'
end
