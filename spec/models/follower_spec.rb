require 'rails_helper'

RSpec.describe Follower, type: :model do
	let (:user) {FactoryGirl.create(:user)}
	let (:organization) { FactoryGirl.create(:organization)}
	let (:follower_a) {FactoryGirl.create(:follower,organizer_id:user.id,organization_id:organization.id)}
	let (:follower_n) {FactoryGirl.create(:follower,organizer_id:user.id,organization_id:organization.id,address:nil,street_name:nil,street_number:nil)}
	let (:tag) {Tag.create!(name:'feminist')}

	context "creation" do
	end

	context "model methods" do 
		it 'should convert address to google-friendly string' do 
			follower = FactoryGirl.create(:follower,organizer_id:user.id,organization_id:organization.id,address:'1461 W Fullerton Ave, Chicago, IL, United States')
			expect(Follower.to_ggl_api_address(follower.address)).to eq("1461+W+Fullerton+Ave,+Chicago,+IL,+United+States")
		end

		it 'should return street address when possible' do 
			expect(follower_a.ggl_address).to match(/^\d+.*?$/)
		end

		it 'should return coordinates when only neighborhood exists' do 
			expect(follower_n.ggl_address).to match(/^-?\d+.\d+,-?\d+.\d+/)
		end


	end

	context "relationships" do 
		it 'should have a relationship to organizer' do 
			expect(follower_a.organizer.full_name).to eq(user.full_name)
			expect(follower_a.organization.name).to eq(organization.name)
		end

		it 'should be notable' do
			note = FactoryGirl.create(:note,notable_type:follower_a.class,notable_id:follower_a.id,info:"Does not like birds",author_id:user.id)
			expect(follower_a.notes.length).to eq(1)
			expect(follower_a.notes.first.info).to eq('Does not like birds')
		end

		it 'should have tags' do 
			Tagging.create!(tag_id:tag.id,taggable_type:'Follower',taggable_id:follower_a.id)
			expect(follower_a.tags.length).to eq(1)
			expect(follower_a.tags.first.name).to eq('feminist')
		end

	end



end
