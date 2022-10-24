class Public::RelationshipsController < ApplicationController
  
  def index
  end
  
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
  end
  
  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
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
