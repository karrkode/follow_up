require 'rails_helper'

RSpec.describe Terf, type: :model do
  context 'initialization' do

  	let(:user) {FactoryGirl.create(:user)}
  	let(:organization) {FactoryGirl.create(:organization)}

  	it 'should be correct' do
  		terf = FactoryGirl.create(:terf,owner_id:user.id,organization_id:organization.id)
  		expect(terf.organization).to eq(organization)
  	end

  end
end
