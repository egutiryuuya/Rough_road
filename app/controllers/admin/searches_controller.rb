class Admin::SearchesController < ApplicationController
   before_action :authenticate_admin!
  def search
    @range = params[:range]
    if@range == "ユーザー名"
      @customers = Customer.looks(params[:word])
     
      render "admin/searches/search_result"
    else
      @game_titles = GameTitle.looks(params[:word])
      render "admin/searches/search_result"
    end
  end
  
  def search_result
    @game_titles = GameTitle.all
  end  
end