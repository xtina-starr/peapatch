require 'spec_helper'

describe Tool do
  let(:tool) { create(:tool) }
  describe 'validates' do
    it 'be valid' do
      expect(tool).to be_valid
    end

    it 'kind is present' do
      tool.update(kind: nil)
      expect(tool.errors[:kind]).to include("can't be blank")
    end 
  end

  describe 'available_tool' do
    it 'returns a tool object' do
      tool.update(user_id: nil)
      expect(Tool.available_tool).to be_an_instance_of(Tool)
    end

    
  end


      # tool_collection = Tool.where(kind: "rake")
      # free_tools = tool_collection.collect.where(user_id: nil)
      # free_tools.first

end