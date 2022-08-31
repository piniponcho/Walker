class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @walker = @reservation.record.route.user
    @user = @reservation.dog.user
    @chatroom = Chatroom.new(reservation: @reservation, walker: @walker, user: @user)
  end
end
