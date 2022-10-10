class Public::CustomersController < ApplicationController
  def edit 
    @customer = Customer.find(params[:id])
  end
  
  def update
  end
end
