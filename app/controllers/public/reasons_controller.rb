class Public::ReasonsController < ApplicationController
  def new
    @reason= GameScore.new
    @game_score = GameScore.find(params[:game_score_id])
    @reasons = Reason.all
  end
  
  def create
    @reason= Reason.new(reason_params)
    @reason.save
    redirect_to root_path
  end
  
  private
  def reason_params
    params.require(:reason).permit(:status,:title,:game_score_id)
  end
end
