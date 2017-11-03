class Tag < ApplicationRecord
	has_many :taggings	
	belongs_to :taggable, polymorphic: true, optional:true
end
