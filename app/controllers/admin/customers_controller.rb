class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(6).order('created_at DESC')
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
