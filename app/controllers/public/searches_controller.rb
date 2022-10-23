class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    @range = params[:range]
    
    if@range == "ユーザー名"
      @customers = Customer.looks(params[:word]).page(params[:page]).per(20)
      render "public/searches/search_result"
    else
      @game_titles = GameTitle.looks(params[:word]).page(params[:page]).per(20)
      render "public/searches/search_result"
    end
  end
  
  def search_result
     
  end  
  
end
  
