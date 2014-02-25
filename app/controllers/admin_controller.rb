# AdminController
class AdminController < ApplicationController
  before_action :check_admin

  def index
  end

  def admin_access
    @user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to admin_path, notice: "You have successfully added #{@user.username} as an Admin User."

  end

  def revoke_admin
    @user = User.find(params[:id])
    @user.update(admin: false)
    redirect_to admin_path, notice: "You have successfully revoked #{@user.username}'s admin access."
  end

  private
  def check_admin
    unless @current_user.admin?
      redirect_to root_path, notice: "You do not have Admin access!"
    end
  end

end
