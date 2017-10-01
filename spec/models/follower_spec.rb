require 'rails_helper'

RSpec.describe Follower, type: :model do
	let (:user) {FactoryGirl.create(:user)}
	let (:organization) { FactoryGirl.create(:organization)}
	let (:follower) {FactoryGirl.create(:follower,organizer_id:user.id,organization_id:organization.id)}

	context "relationships" do 
		it 'should have a relationship to organizer' do 
			expect(follower.organizer.full_name).to eq(user.full_name)
			expect(follower.organization.name).to eq(organization.name)
		end

		it 'should be notable' do
			note = FactoryGirl.create(:note,notable_type:follower.class,notable_id:follower.id,info:"Does not like birds",author_id:user.id)
			expect(follower.notes.length).to eq(1)
			expect(follower.notes.first.info).to eq('Does not like birds')
		end

	end



end
