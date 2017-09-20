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
		end
	end

end
