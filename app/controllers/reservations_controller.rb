class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update delete]

  def index
    # @reservations = Reservation.joins(record: :route).where(route: {user_id: current_user})
    if current_user.walker_status == true
      @reservations = Reservation.select { |r| r.route.user == current_user }
    else
      @reservations = Reservation.select { |r| r.dog.user == current_user }
    end
  end

  def show
  end

  def new
    @record = Record.find(params[:record_id])
    @reservation = Reservation.new
    @dogs = Dog.where(user: current_user)
  end

  def create
    @record = Record.find(params[:record_id])
    @reservation = Reservation.new(reservation_params)
    @walker = @record.route.user
    @user = current_user
    @reservation.record = @record
    if @reservation.save
      @record.update(available: @record.available - 1)
      @chatroom = Chatroom.new(name: "chatroom", reservation_id: @reservation.id, walker_id: @walker.id, user_id: @user.id)
      @chatroom.save
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path
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
