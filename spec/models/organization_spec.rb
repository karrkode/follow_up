require 'rails_helper'

RSpec.describe Organization, type: :model do
  
	let (:user) { User.create(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')}
	let (:organization) { Organization.create(name:'Our revolution', website:'www.google.com')}

  context 'describe relationships' do 
  	it 'should return members of an organization' do
	  	membership = Membership.create(user_id:user.id,organization_id:organization.id) 
  		expect(organization.members.count).to eq(1)
  		expect(organization.members.first.full_name).to eq('Andrew Carr')
  	end
  end
end
