class Public::RequestsController < ApplicationController
  
  def new
    @request = Request.new
  end
  
  def create 
    @request = Request.new(request_params)
    @request.save
    flash[:notice] = "リクエストが送信されました"
    redirect_to reviews_path
  end
  
  private
  
  def request_params
    params.require(:request).permit(:title,:reason)
  end
end
