class Public::FavoritesController < ApplicationController
  
  def index
    @customer = Customer.find(params[:customer_id])
    @favorites = Favorite.where(customer_id: current_customer.id)

  end
  
  def create
    @game_score = GameScore.find(params[:game_score_id])
    favorite = current_customer.favorites.new(game_score_id: @game_score.id)
    favorite.save
  end
  
  def destroy
    @game_score = GameScore.find(params[:game_score_id])
    favorite = current_customer.favorites.find_by(game_score_id: @game_score.id)
    favorite.destroy
  end
  
end
