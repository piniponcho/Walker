class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update delete destroy]
  def index
    @dogs = Dog.where(user: current_user)
  end

  def show
  end

  def new
    @dog = Dog.new
    @user = current_user
  end

  def create
    @user = current_user
    @dog = Dog.create(dog_params)
    @dog.user = @user
    if @dog.save
      redirect_to dogs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, status: :see_other
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :birthday, :breed, :age, :weight, :size, :photo)
  end
end
