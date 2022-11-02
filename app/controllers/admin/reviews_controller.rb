class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to admin_reviews_path
  end

  def destroy 
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:customer_id,:title,:body,:is_settled)
  end
  
end
