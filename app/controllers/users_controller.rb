class UsersController < ApplicationController
  def index
  end

  def show
  end

  def avatar
  end

  def update
    current_user.update_attributes user_params
    render :avatar
  end

  protected

  def user_params
    params.require(:user).permit(:avatar)
  end
end
