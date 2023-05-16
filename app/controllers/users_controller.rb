class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = User.find(current_user.id)
  end

  def check_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

end