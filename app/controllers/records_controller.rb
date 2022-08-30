class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update delete]

  def index
    # @route = Route.find(params[:route_id])
    # record = Record.new()
  end

  def show
  end

  def new
    @record = Record.new
    @user = current_user
  end

  def create
    @route = Route.find(params[:route_id])
    @record = Record.new(record_params)
    @record.route_id = @route.id
    if @record.save
      redirect_to route_path(@route)
    else
      render "routes/show", status: :unprocessable_entity
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
    authorize @record
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
