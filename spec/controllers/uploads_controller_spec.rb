require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

  context 'generated tests' do

    let (:user)  { FactoryGirl.create(:user) } 

    before(:each) do 
      login(user)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, params: {user_id:user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do 
      it 'return http success' do 
        upload = FactoryGirl.create(:upload,affiliate_id:1,uploader_id:user.id)
        get :show, params: {user_id:user.id,id:upload.id}
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
