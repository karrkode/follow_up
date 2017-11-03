class Note < ApplicationRecord
	belongs_to :notable, polymorphic:true
	belongs_to :author, class_name: 'User'
	has_many :taggings, :as => :taggable
	has_many :tags, through: :taggings

	def toNoteDiv
		"<div class='follower-note'>
			<span class='note-text'>#{self.info}</span>
			<br>
			" + tagDivs + "<h7> Added #{self.created_at unless self.created_at.nil?} </h7>
			</div>"
	end

	def tagDivs
		str = ""
		self.tags.each do |tag|
			str += "<div class='tagDiv'> #{tag.name} </div>"
		end
		str
	end

	def add_tags(ids)
		ids.first.split(",").map(&:to_i).each do |id|
			next if id == ""
			Tagging.create!(taggable_type:'Note',taggable_id:self.id,tag_id:id.to_i)
		end
	end

end