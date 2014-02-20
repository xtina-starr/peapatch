require 'spec_helper'
describe AdminController do
  describe 'GET index' do
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'admin access method' do
    let(:user) { create(:user, admin: false) }
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end
    it 'sets admin access to true' do
      post :admin_access, id: user.id
      expect(User.find(user.id).admin).to be(true)
    end
  end

  describe 'revoke admin method' do
    let(:user) { create(:user, admin: true) }
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end
    it 'removes admin access' do
      post :revoke_admin, id: user.id
      expect(User.find(user.id).admin).to be(false)
    end
  end
end
