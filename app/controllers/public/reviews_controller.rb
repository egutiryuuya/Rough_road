class Public::ReviewsController < ApplicationController
  def new 
    @review = Review.new
  end
  
  def create 
    review = Review.new(review_params)
    review.score = Language.get_data(review_params[:body])
    if review.save
      redirect_to reviews_path
    end
  end
  
  def index
    @reviews = Review.all
  end
  
  def destroy 
  end
  
  private
  def review_params
    params.require(:review).permit(:customer_id,:title,:body,:is_settled)
  end
end
