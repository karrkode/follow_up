require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

  context 'generated tests' do

    let (:user)  { FactoryGirl.create(:user) } 

    before(:each) do 
      login(user)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {user_id:user.id}
        expect(response).to have_http_status(:success)
      end
    end


    xdescribe "GET #destroy" do
      it "returns http success" do
        get :destroy
        expect(response).to have_http_status(:success)
      end
    end
  end

end
