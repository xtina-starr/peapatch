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
    let!(:tool) {create(:tool, kind: 'rake', user_id: nil)}
    it 'returns a tool object' do
      expect(Tool.available_tool('rake')).to be_an_instance_of(Tool)
    end

    it 'returns the first specific tool type with user_id nil' do
      first_tool = Tool.create(kind: 'rake', user_id: 1)
      second_tool = Tool.create(kind: 'hoe', user_id: nil)
      third_tool = Tool.create(kind: 'hoe', user_id: 1)
      
      expect(Tool.available_tool("hoe")).to eq(second_tool)
    end
  end

end