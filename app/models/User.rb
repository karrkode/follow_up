class User < ApplicationRecord
	has_many :memberships
	has_many :affiliations, :through => :memberships, :source => :organization
	has_many :followers, :foreign_key => :organizer_id
	
	has_secure_password

	validates_presence_of :first_name, :last_name, :email, :password_digest

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	validates :first_name, length: {minimum:3}

	validates :email, uniqueness: true

	def full_name
		first_name + " " + last_name
	end
end