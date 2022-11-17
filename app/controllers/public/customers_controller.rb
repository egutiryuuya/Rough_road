class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer,only: [:edit,:update,:unsubscribe]
  
  def index
    customers = Customer.all
    @customers=customers.where.not(id: current_customer.id ).where.not(name: "guest_user")
    @articles=@customers.page(params[:page])
  end

  def show
    @customer= Customer.find(params[:id])
    @game_scores =@customer.game_scores.includes(:game_title,:reasons).page(params[:page]).per(6).order('created_at DESC')
  end
    
  def edit 
    @customer = Customer.find(params[:id])
    if current_customer.name=="guest_user"
      redirect_to game_titles_path
    else
      @customer = Customer.find(params[:id])
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
  if  @customer.update(customer_params)
     flash[:notice] ="更新に成功しました"
    redirect_to customer_path(@customer)
  else
    flash[:alert] = "その名前は既に使われている可能性があります。また、名前は1文字以上15文字以下プロフィールは50文字以下にしてください"
    redirect_to edit_customer_path(@customer)
  end
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
  
  def correct_customer
        @customer= Customer.find(params[:id])
    unless @customer.id == current_customer.id
      redirect_to customer_path(current_customer)
    end
  end
  
  
  def customer_params
    params.require(:customer).permit(:name,:profile,:customer_image)
  end
end
