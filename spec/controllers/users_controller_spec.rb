require 'spec_helper'
describe UsersController do

  describe 'user email method' do
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end

    it 'updates user email address' do
      post :user_email, { id: current_user.id, email: current_user.email }
      expect(current_user.reload.email).to_not be_nil
    end
  end
end
