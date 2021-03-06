class UsersController < ApplicationController

def new
    if !logged_in?
       @user = User.new
    else
        redirect_to dealers_path
    end
end


def create 
@user = User.new(user_params)
if @user.save
    session[:user_id] = @user.id
    redirect_to dealers_path
else
    render :new
end

end

def show
    @user = User.find(params[:id])
end

private
def user_params
    params.require(:user).permit(:username, :password)
end
end
