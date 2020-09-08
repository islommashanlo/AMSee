class SessionsController < ApplicationController

  def new 
  end 


  def login 
    
    # find a user by their name
    user = User.find_by(name: params[:session][:username])

    # Authenticate a user by their password
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      flash[:errors] = "We're sorry. Username or Password Incorrect"
      redirect_to new_login_path
    end 
  end 


  def logout
    session.delete(:user_id)
    redirect_to welcome_path
  end 


end