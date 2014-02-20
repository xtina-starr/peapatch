require 'spec_helper'
describe ToolsController do
  describe 'checkout_tool method' do
    let(:current_user) { create(:user) }
    before(:each) do
      controller.instance_variable_set(:@current_user, current_user)
    end

    let!(:tool) { create(:tool, kind: 'rake', user_id: nil) }
    it 'assign available tool to user' do
      post :checkout_tool, id: tool.id
      expect(tool.reload.user_id).to eq(current_user.id)
    end
  end

  describe 'checkin_tool method' do
    # let!(:tool) { create(:tool, kind: 'rake', user_id: 1) }
    it 'sets user_id to nil' do
      first_tool = Tool.create(kind: 'rake', user_id: 1)
      post :checkin_tool, id: first_tool.id
      expect(first_tool.reload.user_id).to eq(nil)
    end
  end
end
