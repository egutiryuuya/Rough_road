class Public::WinReasonsController < ApplicationController
  def new
    @reasons = WinReason.all
  end
  
  def create
    @win_reason= WinReason.new(win_reason_params)
    @game_score = GameScore.find(params[:game_score_id])
    @win_reason.game_score_id=@game_score
    if @win_reason.save
      redirect to request refferer
    end
  end
  
  private
  def win_reason_params
    params.require(@win_reason).permit(:reason,:game_score_id)
  end
end
