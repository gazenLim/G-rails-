class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to dealers_path
    end

  end

    def login
      return unless request.post?
  
      @user = User.new(params[:user])
      if @user.valid_login?
    
  end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dealers_path 
    else
      flash[:message] = "Please try again."
      redirect_to login_path, alert: "Invalid credentials. Please try again."
      end
  end


  def destroy
    session.delete :user_id
    redirect_to login_path
  end
  

  def omniauth
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['first_name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)

    end
      if user.save
        session[:user_id] = user.id
        redirect_to dealers_path
    else
        flash[:message] = user.errors.full_messages.join(", ")
        redirect_to login_path
    end
end


private
  def auth 
  request.env['omniauth.auth']
  end

  




end
