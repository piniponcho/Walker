if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {user: @user, review: Review.new})
  json.inserted_item render(partial: "users/reviews", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {user: @user, review: @review})
end
