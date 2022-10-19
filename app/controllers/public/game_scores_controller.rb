class Public::GameScoresController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @game_score =  GameScore.find(params[:id])
    @game_title = GameTitle.find(params[:game_title_id])
    @customer = @game_score.customer
    @reason = Reason.new
  end
  
  def index
    @game_title=GameTitle.find(params[:game_title_id])
    @game_scores= @game_title.game_scores.all
  end
  
  def create
    @game_score= GameScore.new(score_params)
    @game_score.customer_id= current_customer.id
    if  @game_score.save
      redirect_to game_title_game_score_path(@game_score.game_title_id,@game_score)
    end
  end
  
  private
  def score_params
    params.require(:game_score).permit(:game_title_id,:customer_id)
  end
end
