class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update delete destroy]
  def index
    @dogs = policy_scope(Dog)
  end

  def show
    authorize @dog
  end

  def new
    @dog = Dog.new
    authorize @dog
    @user = current_user
  end

  def create
    @user = current_user
    @dog = Dog.create(dog_params)
    @dog.user = @user
    authorize @dog
    if @dog.save
      redirect_to dogs_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @dog
  end

  def update
    authorize @dog
    if @dog.update(dog_params)
      redirect_to dogs_path(@dog)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    authorize @dog
    redirect_to dogs_path, status: :see_other
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :weight, :size)
  end
end
