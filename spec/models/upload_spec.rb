require 'rails_helper'

RSpec.describe Upload, type: :model do
	let (:user) { User.create(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')}
	let (:organization) { Organization.create(name:'Our revolution', website:'www.google.com')}
	let (:upload) {FactoryGirl.create(:upload,uploader_id:user.id,organization_id:organization.id)}

	context 'relationships' do 
		it 'should belong to a user' do 
			expect(upload.uploader.email).to eq(user.email)
		end

		it 'should belong to an organization' do 
			expect(upload.organization.name).to eq(organization.name)
		end

	end

end
