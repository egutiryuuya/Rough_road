class Public::FavoritesController < ApplicationController
  
  def index
    @customer = Customer.find(params[:customer_id])
    @favorites = Favorite.where(customer_id: current_customer.id)

  end
  
  def create
    @game_score = GameScore.find(params[:game_score_id])
    favorite = current_customer.favorites.new(game_score_id: @game_score.id)
    favorite.save
    redirect_to game_title_game_score_path(@game_score.game_title_id,@game_score)
  end
  
  def destroy
    @game_score = GameScore.find(params[:game_score_id])
    favorite = current_customer.favorites.find_by(game_score_id: @game_score.id)
    favorite.destroy
    redirect_to game_title_game_score_path(@game_score.game_title_id,@game_score)
  end
  
end
