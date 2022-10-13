class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    @range = params[:range]
    
    if @range == "Customer"
      @customers = Customer.looks(params[:word])
      render "public/searches/search_result"
    else
      @game_titles = GameTitle.looks(params[:word])
      render "public/searches/search_result"
    end
  end
  
  def search_result
     
  end  
  
end
  
