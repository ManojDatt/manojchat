class UsersController < ApplicationController
  


def new
@user=User.new
end
	def create
    user = User.new(user_params)
    if user.save
    
      redirect_to home_path
    else
      redirect_to new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :user_type,:password, :password_confirmation)
  end
end
