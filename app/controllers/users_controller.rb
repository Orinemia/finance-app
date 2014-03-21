class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end
  
  def register
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)     
  	if @user.save 
  		  flash[:success] = "Welcome to the Finance App!"
  	      redirect_to @user
    else
    	render 'register'
    end
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
