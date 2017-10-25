class Note < ApplicationRecord
	belongs_to :notable, polymorphic:true
	belongs_to :author, class_name: 'User'
	has_many :taggings, :as => :taggable
	has_many :tags, through: :taggings

	def toNoteDiv
		"<div class='follower-note'>
			<span class='note-text'>#{self.info}</span>
			<br>
			<h5> Added #{self.created_at unless self.created_at.nil?} </h5>
			</div>"
	end

end