class Follower <ApplicationRecord
	belongs_to :organization
	belongs_to :organizer, class_name: 'User'

	validates_presence_of :first_name, :last_name

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


	def full_name
		first_name + " " + last_name
	end
end