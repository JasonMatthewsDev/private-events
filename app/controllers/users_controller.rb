class UsersController < ApplicationController
  
  def show
    unless @user = User.find_by(id: params[:id])
      flash[:danger] = 'User not found'
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:sucess] = 'New user created'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end
  
  private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
