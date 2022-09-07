class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = User.find(params[:id])
    @review = Review.new
    @review.user = @user
    @chatrooms = Chatroom.where(user_id: @user.id)
  end
end
