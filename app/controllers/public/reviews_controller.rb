class Public::ReviewsController < ApplicationController
  def new 
    @review = Review.new
  end
  
  def create 
    review = Review.new(review_params)
    review.score = Language.get_data(review_params[:body])
    review.customer_id = current_customer.id
    if review.save
      flash[:notice] = "レビューが送信されました。"
      redirect_to reviews_path
    end
  end
  # 低評価ページ
  def lowrating 
    @reviews = Review.all
  end
  
  # 高評価ページ
  def highrating
    @reviews = Review.all
  end
  
  # 全評価一覧
  def index
    @reviews = Review.all
  end
  
  def destroy 
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:customer_id,:title,:body,:is_settled)
  end
end
