class HomesController < ApplicationController
  def top
  end

  def guest_sign_in
    customer = Customer.find_or_create_by!(name: 'guest_user',email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
    sign_in customer
    redirect_to game_titles_path, notice: "ゲストとしてログインしました"
  end
  
  def about
  end
end
