class Public::ReasonsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_reason,only: [:edit,:new,:lose]
  
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
  
  def edit
    @game_score = GameScore.find(params[:game_score_id])
    @reason= Reason.find(params[:id])
  end
  
  def update
    @reason = Reason.find(params[:id])
    @reasons= Reason.where(title: @reason.title,status: @reason.status)
    if @reasons.update(reason_params)
      flash[:notice] = "更新に成功しました。"
       redirect_to game_title_game_score_path(game_title_id: @reason.game_score.game_title_id, id: @reason.game_score_id)
    else
      flash[:notice] = "更新に失敗しました。"
      @game_score = GameScore.find(params[:game_score_id])
    @reason= Reason.find(params[:id])
    render :edit
    end
  end
  
  def create
  @reason= Reason.new(reason_params)
  if @reason.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to game_title_game_score_path(game_title_id: @reason.game_score.game_title_id, id: @reason.game_score_id)
  else
    flash[:notice] = "投稿に失敗しました。"
    @game_score = GameScore.find(params[:game_score_id])
    @reason= Reason.new
    @reasons = Reason.where(status: "lose",game_score_id: @game_score.id).group(:title)
    render :new
    
    # 敗因でレンダーしても勝因に行ってしまう問題
  end
  end
  
  def destroy
    @reason = Reason.find(params[:id])
    @reasons = Reason.where(title: @reason.title,status: @reason.status,game_score_id: @reason.game_score_id)
    @reasons.destroy_all
    flach[:notice] = "削除に成功しました。"
    redirect_to game_title_game_score_path(game_title_id: @reason.game_score.game_title_id, id: @reason.game_score_id)
  end
  
  def correct_reason
        @game_score = GameScore.find(params[:game_score_id])
    unless @game_score.customer.id == current_customer.id
      redirect_to customer_path(current_customer)
    end
  end
  
  private
   
  def reason_params
    params.require(:reason).permit(:status,:title,:game_score_id)
  end
end
