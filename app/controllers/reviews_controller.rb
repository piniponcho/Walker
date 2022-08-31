class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    respond_to do |format|
      if @review.save
        format.html { redirect_to profile_path(@user) }
        format.text { render partial: "reviews/review", locals: {review: @review}, formats: [:html] }
      else
        format.html { render "pages/profile", status: :unprocessable_entity }
        format.text # Follow the classic Rails flow and look for a create.json view
      end
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
