require 'rails_helper'

RSpec.describe Organization, type: :model do
  
	let (:user) { User.create(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')}
	let (:organization) { Organization.create(name:'Our revolution', website:'www.google.com')}

  context 'describe relationships' do 
  	it 'should return leaders of an organization' do
	  	membership = Membership.create(user_id:user.id,organization_id:organization.id) 
  		expect(organization.leaders.count).to eq(1)
  		expect(organization.leaders.first.full_name).to eq('Andrew Carr')
  	end

    it 'should return all members' do 
      u = FactoryGirl.create(:follower,organization_id:organization.id,organizer_id:user.id)
      expect(organization.members.count).to eq(1)
      expect(organization.members.first).to eq(u)
    end

    it 'should return the people being organizerd by a respective leader' do 
      membership = Membership.create(user_id:user.id,organization_id:organization.id)
      f = FactoryGirl.create(:follower,organization_id:organization.id,organizer_id:user.id)
      binding.pry
      expect(organization.organizees(user).count).to eq(1)
      expect(organization.organizees(user.full_name)).to eq(f.full_name)
    end


  	it 'should have uploads' do 
  		upload = FactoryGirl.create(:upload,uploader_id:user.id,affiliate_id:organization.id)
  		expect(organization.uploads.count).to eq(1)
  		expect(organization.uploads.first.name).to eq(upload.name)
  	end

  end
end
