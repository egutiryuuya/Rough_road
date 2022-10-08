class Public::ReasonsController < ApplicationController
  def index
  end
  
  
  def new
    @reason= Reason.new
    @game_score = GameScore.find(params[:game_score_id])
    @game_score.customer_id=current_customer
    @reasons = Reason.where(status: "win",game_score_id: @game_score.id).group(:title)
  end
  
  def lose
    @reason= Reason.new
    @game_score = GameScore.find(params[:game_score_id])
    @game_score.customer_id=current_customer
    @reasons = Reason.where(status: "lose",game_score_id: @game_score.id).group(:title)
  end  
  
  def create
  @reason= Reason.new(reason_params)
  if @reason.save
    redirect_to request.referer
  else
    @game_score = GameScore.find(params[:game_score_id])
    @reason= Reason.new
    @reasons = Reason.where(status: "lose",game_score_id: @game_score.id).group(:title)
    render :new
  end
  end
  
  def destroy
    @reason = Reason.find(params[:id])
    @reasons = Reason.where(title: @reason.title,status: @reason.status,game_score_id: @reason.game_score_id)
    @reasons.destroy_all
    redirect_to root_path
  end
  
  private
   
  def reason_params
    params.require(:reason).permit(:status,:title,:game_score_id)
  end
end
