require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
	describe 'GET landing' do 
		it 'should render a index page' do 
			get :landing
			expect(response).to render_template('landing')
		end
	end
end
