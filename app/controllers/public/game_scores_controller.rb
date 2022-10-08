class Public::GameScoresController < ApplicationController
  def show
    @game_score= GameScore.find_by(game_title_id: params[:game_title_id],customer_id:current_customer)
    @game_title = GameTitle.find(@game_score.game_title_id)
    @customer = @game_score.customer
    @reason = Reason.new
  end
  
  def create
    @game_score= GameScore.new(score_params)
    @game_score.customer_id= current_customer.id
    if  @game_score.save
      redirect_to request.referer
    end
  end
  
  private
  def score_params
    params.require(:game_score).permit(:game_title_id,:customer_id)
  end
end
