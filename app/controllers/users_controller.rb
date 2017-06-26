# users controller generated for account page

class UsersController < ApplicationController

  def account
    #created so that the account page can route to this controller
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to root_path
      # Handle a successful update.
    else
      render edit_user_registration_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end