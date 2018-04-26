class Terf < ApplicationRecord

	belongs_to :organization
	has_many :terf_entries
	belongs_to :upload

end
