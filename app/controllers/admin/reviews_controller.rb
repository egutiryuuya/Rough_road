class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = Review.all.page(params[:page]).per(10)
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to admin_reviews_path
  end
  # 未確認質問
  def resolved
    @reviews = Review.where(is_settled: 1).page(params[:page]).per(10)
  end
  
  # 確認済み質問
  def unsolved
    @reviews = Review.where(is_settled: 0).page(params[:page]).per(10)
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
