class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update delete]
  def index
    @records = Record.where(user: current_user)
  end

  def show
  end

  def new
    @record = Record.new
    @user = current_user
  end

  def create
    @user = current_user
    @record = Record.create(record_params)
    @record.user = @user
    if @record.save
      redirect_to records_path(@record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to records_path(@record)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path, status: :see_other
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:start_time, :end_time)
  end
end
