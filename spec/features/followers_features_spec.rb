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

	context 'tags' do 
		let (:user) {FactoryGirl.create(:user,email:'sambig@gmail.com')}

		xit 'should be taggable' do 
			visit '/login'

	    within('#newSession') do 
	      fill_in 'Email', with: user.email
	      fill_in 'Password', with: 'password'
	    end

	    click_button 'Login'

			visit "/users/#{user.id}/followers/new"

			within('#new_follower') do 
				fill_in 'First name', with: 'Sean'
				fill_in 'Last name', with: 'Sanders'
				fill_in 'Email', with: 'emailAllDay@gmail.com'
				choose('Our Revolution', allow_label_click: true) #trouble
				check('Feminist')
				fill_in 'Address', with: '1461 W Fullerton Ave, Chicago, IL 60614'
			end

			click_button 'Create Follower'

			visit("/users/#{user.id}/followers/#{Follower.last.id}")

			expect(page).to have_content('Feminist')

		end

	end

end