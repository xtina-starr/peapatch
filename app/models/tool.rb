class Tool < ActiveRecord::Base
  validates :kind, presence: true

  def self.available_tool
    tool = Tool.where(kind: "rake")
    rakes = tool.select { |t| t.kind = "rake" }
    rakes.first
  end
end