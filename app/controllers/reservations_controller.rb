class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update delete]

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @reservation = Reservation.create(reservation_params)
    @reservation.user = @user
    if @reservation.save
      redirect_to reservations_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:record_id, :dog_id)
  end
end
