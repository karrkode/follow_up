require 'rails_helper'

RSpec.describe Terf, type: :model do
  context 'initialization' do

  	let(:user) {FactoryGirl.create(:user)}
  	let(:organization) {FactoryGirl.create(:organization)}
  	let(:upload) {FactoryGirl.create(:upload,uploader_id:user.id,organization_id:organization.id)}

  	it 'should have associations' do
  		terf = FactoryGirl.create(:terf,upload_id:upload.id,organization_id:organization.id)
  		expect(terf.organization).to eq(organization)
  	end

  end
end
