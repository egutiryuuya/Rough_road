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
     flash[:alert] = "その名前は既に使われている可能性があります。また、名前は1文字以上15文字以下プロフィールは50文字以下にしてください"
    render :edit
  end
  end

  private
    def customer_params
      params.require(:customer).permit(:name,:profile,:email,:is_deleted)
    end
  
end
