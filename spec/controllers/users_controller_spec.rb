require 'rails_helper'

RSpec.describe UsersController, type: :controller do
		let (:user)  { FactoryGirl.create(:user) }
		let (:user2) { FactoryGirl.create(:user) }

		before(:each) do 
			login(user)
		end

	context 'standard routes' do 
		it 'should respond with success' do 
			get :index
			expect(response).to have_http_status(200)
		end

	end

	context 'security' do
		it 'should prevent unathorized user from editing another using' do 
			get :edit, params: {id: user2.id}
			expect(response).to redirect_to(root_path)
		end

	end

end
