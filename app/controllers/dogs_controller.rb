class DogsController < ApplicationController
  before_action :set_dog, only:
  def index
    @dogs = Dog.where(user: current_user)
  end

  def show
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
