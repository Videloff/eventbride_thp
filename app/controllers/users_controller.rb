class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = User.find(params[:id])
    @events = Event.all
  end

  def check_user
    @user = User.find(params['id'])
  if current_user.id != @user.id
    flash[:danger]= "Bien essayé petit malin ! ;P"
    redirect_to root_path
  end
end

end