class Tool < ActiveRecord::Base
  validates :kind, presence: true

  def self.available_tool(tool_type)
    tools = Tool.where(kind: tool_type, user_id: nil)
    tools.first
  end
end