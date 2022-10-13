class Public::RelationshipsController < ApplicationController
  
  def index
  end
  
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end
  
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
  
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings 
    render :index
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
    render :index
  end
end
