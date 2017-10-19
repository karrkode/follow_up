class Note < ApplicationRecord
	belongs_to :notable, polymorphic:true
	belongs_to :author, class_name: 'User'

	def toNoteDiv
		"<div class='follower-note'>
			<span class='note-text'>#{self.info}</span>
			<br>
			<h5> Added #{self.created_at unless self.created_at.nil?} </h5>
			</div>"
	end

end