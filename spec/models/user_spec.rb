require 'rails_helper'

RSpec.describe User, type: :model do
	let (:user) { User.create(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')}
	let (:organization) { Organization.create(name:'Our revolution', website:'www.google.com')}

	context 'basic attributes' do 
		
		describe 'user model' do
		 
			it 'should be a user' do 
				expect(user).to be_a User
			end

		end

		describe 'relationships' do 
			it 'give member names' do 
				membership = Membership.create(user_id:user.id,organization_id:organization.id)
				expect(user.memberships.count).to eq(1)
				expect(user.affiliations.first.name).to eq('Our revolution')
			end

			it 'should have followers' do 
				follower = FactoryGirl.create(:follower,organization_id:organization.id,organizer_id:user.id)
				expect(user.followers.length).to eq(1)
				expect(user.followers.first.full_name).to eq(follower.full_name)
			end

			it 'should have uploads' do 
				upload = FactoryGirl.create(:upload,affiliate_id:organization.id,uploader_id:user.id)
				expect(user.uploads.length).to eq(1)
				expect(user.uploads.first).to eq(upload)
			end

		end

	end

end
