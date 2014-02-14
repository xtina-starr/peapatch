class ToolsController < ApplicationController

  def index
    @all_the_tools = Tool.all
    if current_user
      @users_checkedout_tools = Tool.user_tools(@current_user)
    else
      redirect_to "/", notice: "You must be longed in to do that."
    end
  end


  def checkout_tool
    @tool = Tool.find(params[:id])
    if Tool.available_tool(@tool.kind)
      @tool.user_id = @current_user.id 
      @tool.save
      redirect_to tools_path, notice: "You have checked out #{@tool.kind}."
    else
      redirect_to tools_path, notice: "Unfortunately that tool is not available. Check back later."
    end
  end

  def checkin_tool
    @tool = Tool.find(params[:id])
    @tool.user_id = nil
    @tool.save
    redirect_to tools_path, notice: "You have checked in #{@tool.kind}."
  end

end