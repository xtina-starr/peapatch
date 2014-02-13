class ToolsController < ApplicationController

  def index
  end

  def checkout_tool
    @tool = Tool.find(params[:id])
    if Tool.available_tool(tool_type)
      @tool.user_id = @current_user.id 
    else
      redirect_to "/", notice: "Unfortunately that tool is not available. Check back later."
    end
  end

end