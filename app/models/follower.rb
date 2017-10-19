class Follower <ApplicationRecord
	belongs_to :organization
	belongs_to :organizer, class_name: 'User'
	has_many :notes, as: :notable
	validates_presence_of :first_name, :last_name

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


	def full_name
		first_name + " " + last_name
	end

	def ggl_address
		self.street_number.nil? ? "#{self.longitude},#{self.latitude}" : Follower.to_ggl_api_address(self.address)
	end

	def self.to_ggl_api_address(addr)
		addr.gsub(" ","+")
	end

end