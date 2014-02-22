require 'spec_helper'
describe CalendarsController do 

  context 'with logged-in admin' do
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end

    describe 'INDEX' do      
      it 'is successful' do 
        get :index 
        expect(response).to be_successful
      end
    end
  end

  context 'without a logged-in user' do
    describe 'INDEX' do 
      it 'redirects' do 
        get :index
        expect(response.status).to eq(302)
      end
    end
  end
end