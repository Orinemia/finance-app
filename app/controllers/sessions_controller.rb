class SessionsController < ApplicationController

  def login
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_to user
  		# (Orinemia) This should sign the user in and redirect to the user's show page.
  	else
  		@error = "Invalid email/password combination"  # We'll manage this for now.
  		render 'login'
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
