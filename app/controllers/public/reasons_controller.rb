class Public::ReasonsController < ApplicationController
  def new
    @reason= Reason.new
    @game_score = GameScore.find(params[:game_score_id])
    @game_score.customer_id=current_customer
    @reasons = Reason.group(:title)
  end
  
  def create
  
    @reason= Reason.new(reason_params)
   
  if @reason.save
    redirect_to request.referer
  else
    @reason= Reason.new
    @game_score = GameScore.find(params[:game_score_id])
    @reasons = Reason.all
    render :new
  end
  end
  
  private
   
  def reason_params
    params.require(:reason).permit(:status,:title,:game_score_id)
  end
end
