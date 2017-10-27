require 'rails_helper'

RSpec.describe "followers/new.html.erb", type: :view do

	let(:user) {FactoryGirl.create(:user)}

	xcontext 'creation' do

		it 'should have a tags check boxes' do 
			controller.extra_params = {:id => user.id}
			assign(current_user,user)
			assign(:follower,Follower.new)

			render

			expect(rendered).to match(/Tags/)
		end
	end

end
