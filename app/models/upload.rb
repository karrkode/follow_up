class Upload < ApplicationRecord
	belongs_to :uploader, class_name: 'User'
end
