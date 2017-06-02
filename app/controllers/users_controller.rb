class UsersController < ApplicationController

  def index
    @users = User.all
  end

   def show
    @user = User.find(params[:id])
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end

  def update
    @user = User.find(params[:id])
    @user.super_user = true
    @user.save

    redirect_to user_path
  end

end
