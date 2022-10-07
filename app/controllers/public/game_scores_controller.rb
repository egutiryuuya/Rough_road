class Public::GameScoresController < ApplicationController
  def show
    @game_title = GameTitle.find(params[:game_title_id])
    @game_score= GameScore.find_by(game_title_id: @game_title.id,customer_id:current_customer)
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
