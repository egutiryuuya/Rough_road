class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
    @customer= Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to admin_customers_path
  else
    @customer=Customer.find(params[:id])
    render :edit
  end
  end

  private
    def customer_params
      params.require(:customer).permit(:name,:profile,:email,:is_deleted)
    end
  
end
