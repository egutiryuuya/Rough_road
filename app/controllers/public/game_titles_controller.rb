class Public::GameTitlesController < ApplicationController
  def index
    @game_titles = GameTitle.all
  end
  
  def show
    @game_title = GameTitle.find(params[:id])
    @game_score = GameScore.new
    @winrate = GameScore.find_by(game_title_id: @game_title.id,customer_id:current_customer)
    
  end
end
