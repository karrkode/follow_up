class Follower <ApplicationRecord
	belongs_to :organization
	belongs_to :organizer, class_name: 'User'
	has_many :notes, as: :notable
	has_many :taggings, :as => :taggable
	has_many :tags, through: :taggings
	validates_presence_of :first_name, :last_name

	attr_reader :tag_ids

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


	def full_name
		first_name + " " + last_name
	end

	def ggl_address
		self.street_number.nil? ? "#{self.longitude},#{self.latitude}" : Follower.to_ggl_api_address(self.address) #refactor
	end

	def self.to_ggl_api_address(addr)
		addr.gsub(" ","+")
	end

	def add_tags(ids)
		ids.each do |id|
			next if id == ""
			Tagging.create!(taggable_type:'Follower',taggable_id:self.id,tag_id:id.to_i)
		end
	end

end