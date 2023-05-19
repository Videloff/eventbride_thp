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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(first_name: params['first_name'], last_name: params['last_name'], description: params['description'])
      flash[:success] = "Votre profil a bien été modifié !"
      redirect_to @user
    else
      render :edit
    end
  end

end