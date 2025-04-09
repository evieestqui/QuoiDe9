class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  def restaurant_mode
    current_user.update(mode: "restaurant")
    redirect_to restaurants_path
  end

  def experience_mode
    current_user.update(mode: "experience")
    redirect_to experiences_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :preferences)
  end
end
