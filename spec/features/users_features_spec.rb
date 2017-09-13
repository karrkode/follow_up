require 'rails_helper'

describe "the user actions ", :type => :feature do
  # before :each do
  #   User.make(email: 'user@example.com', password: 'password', password_confirmation: 'password')
  # end

  it "signs in a users" do
    visit '/users/new'
    within("#new_user") do
      fill_in 'First name', with: 'Andrew'
      fill_in 'Last name', with: 'Carr'
      fill_in 'Email', with: "a4@gmail.com"
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'Create User'
    expect(page).to have_content 'Andrew Carr'
  end

  


end