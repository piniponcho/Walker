class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
