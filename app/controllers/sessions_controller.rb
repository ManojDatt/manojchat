class SessionsController < ApplicationController

  def new
   
  end

  def create
    user = User.find_by_email(params[:user][:email])
   
    if user && user.authenticate(params[:user][:password])
  
      session[:user_id] = user.id
      session[:utype]=params[:user][:user_type]
      redirect_to home_path , notice:"Login successful.."
    else
         
      redirect_to new_session_path , notice:"Email or Password may be wrong...."
    end
  end

  def destroy
    session[:user_id] = nil
    session[:utype] = nil
    redirect_to home_path
  end
end
