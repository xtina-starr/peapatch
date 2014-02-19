class UsersController < ApplicationController

    def user_email
    @current_user.update(email: params[:email])
  
      redirect_to profile_path, notice: "Thank you for submitting your email address."
  end
end