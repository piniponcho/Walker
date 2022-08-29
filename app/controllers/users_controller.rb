class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = Flat.find(params[:id])
  end
end
