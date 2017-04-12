class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:notice] = user.name + " is now logged on to the Iron News"

      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end

end
