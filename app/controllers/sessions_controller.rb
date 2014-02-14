class SessionsController < ApplicationController

  def index
    
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user 
        session[:user_id] = @user.id
        redirect_to profile_path
      else
        redirect_to "/", notice: "Failed to save user."
      end
    else
      redirect_to "/", notice: "Failed to authenticate. Please try again."
    end
  end

  def user_email
    @current_user.update(email: params[:email])
  
      redirect_to profile_path, notice: "Thank you for submitting your email address."
  end

  def signin
    redirect_to "/auth/twitter"
  end

  def signout
    session[:user_id] = nil
    redirect_to "/", notice: "You have been successfully signed out."
  end

end