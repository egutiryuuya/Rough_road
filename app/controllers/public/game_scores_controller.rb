class Public::GameScoresController < ApplicationController
  def show
    @game_title = GameTitle.find(params[:game_title_id])
    @customer = Customer.find(params[:id])
    @game
    @game_score= GameScore.all
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
