class UsersController < ApplicationController  # Written by Orinemia Ajulo
 
  def show
  	@user = User.find(params[:id])
  end
  
  def register
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)     
  	if @user.save
        sign_in @user 
  		  flash[:success] = "Welcome to the Finance App!"
  	      redirect_to @user
    else
    	render 'register'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

    # Before filters
end
