require 'spec_helper'
describe ToolsController do 
  describe 'checkout_tool method' do
      let(:current_user) { create(:user) }
      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end

    let!(:tool) { create(:tool, kind: 'rake', user_id: nil) }
    it 'assign available tool to to user' do
      post :checkout_tool, id: tool.id
      expect(tool.user_id).to eq(current_user.id) 
    end
  end
end