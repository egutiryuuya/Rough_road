class Public::CustomersController < ApplicationController
  
  def index
    @customers=Customer.where.not(id: current_customer.id ).where.not(name: "guest_user")
  end

  def show
    @customer= Customer.find(params[:id])
    @game_scores =@customer.game_scores
  end
    
  def edit 
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to game_titles_path
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def unsubscribe
  end
  
  def customer_params
    params.require(:customer).permit(:name,:profile)
  end
end
