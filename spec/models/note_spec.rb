require 'rails_helper'

RSpec.describe Note, type: :model do
	let (:user) {FactoryGirl.create(:user)}
	let (:organization) {FactoryGirl.create(:organization)}
	let (:follower) {FactoryGirl.create(:follower, organizer_id:user.id,organization_id:organization.id)}
	let (:note) {FactoryGirl.create(:note,notable_type:follower.class,notable_id:follower.id,author_id:user.id)}
	let (:tag) {Tag.create!(name:'feminist')}
	
	context 'creation' do 
	end

	context 'relationships' do 
		it 'should have an author' do 
			expect(note.author.full_name).to eq(user.full_name)
		end

		it 'should have tags' do
			Tagging.create!(tag_id:tag.id,taggable_type:'Note',taggable_id:note.id)
			expect(note.tags.length).to eq(1)
			expect(note.tags.first.name).to eq('feminist') 
		end
	end

end
