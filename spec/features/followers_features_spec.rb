require 'rails_helper'

describe "the user actions ", :type => :feature do

	before(:each) do
		User.delete_all
	end

	context 'input fields' do 
		let (:user) { FactoryGirl.create(:user,email:'joe@gmail.com') }

		it 'should have google maps input' do
			visit '/login'

	    within('#newSession') do 
	      fill_in 'Email', with: user.email
	      fill_in 'Password', with: 'password'
	    end

	    click_button 'Login'

			visit('/users/'+user.id.to_s+'/followers/new')
			expect(page).to have_field("Address")

		end
	end

end