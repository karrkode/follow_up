require 'rails_helper'

describe "the user actions", :type => :feature do
  before :each do
    User.delete_all
  end

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
    expect(User.last.email).to eq('a4@gmail.com')
  end

  it "creates a new session" do
    FactoryGirl.create(:user,first_name:'Andrew',last_name:'Carr', email:'a1@gmail.com')
    visit '/login' 
    within('#newSession') do 
      fill_in 'Email', with: 'a1@gmail.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'Welcome Andrew Carr'
  end



  


end