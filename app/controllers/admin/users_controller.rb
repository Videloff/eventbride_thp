class Admin::UsersController < ApplicationController
  before_action :check_if_admin

  def index
    @users = User.all
    @events = Event.all
  end

  def destroy
    @user = User.find(params[:id])
    Event.all.each do |e|
      if e.admin_id == @user.id
        e.delete
      end
    end
    @user.delete
    flash[:success] = "Utilisateur supprimé"
    redirect_to root_path
  end

  private

  def check_if_admin
    unless current_user&.is_admin
      redirect_to root_path
    end
  end

end