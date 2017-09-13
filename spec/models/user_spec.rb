require 'rails_helper'

RSpec.describe User, type: :model do

	let (:user) { User.create(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')}

	describe 'user model' do 
		it 'should be a user' do 
			expect(user).to be_a User
		end
	end
  
end
