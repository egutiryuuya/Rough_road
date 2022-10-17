class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   
   def  after_sign_in_path_for(resource)
    case resource
    
    when Customer
      game_titles_path
    when Admin
      admin_game_titles_path
    end
   end
   
   protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @customer = Customer.find_by(name: params[:user][:name])
    if @customer
      if @customer.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
