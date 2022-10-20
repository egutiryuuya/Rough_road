class Admin::GameTitlesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @game_titles= GameTitle.all.page(params[:page]).per(6).order('created_at DESC')
  end
  
  def show
  end
  
  def new
    @game_title=GameTitle.new
  end
  
  def edit
    @game_title =GameTitle.find(params[:id])
  end
  
  def create
    @game_title= GameTitle.new(game_title_params)
    if @game_title.save
      redirect_to admin_game_titles_path
    else
      @game_title=GameTitle.new
      render :new
    end
  end
  
  def destroy
    game_title=GameTitle.find(params[:id])
    game_title.destroy
    redirect_to admin_game_titles_path
  end
  
  def update
    @game_title=GameTitle.find(params[:id])
    if @game_title.update(game_title_params)
      redirect_to admin_game_titles_path
    end
  end
  
  private
  
  def game_title_params
    params.require(:game_title).permit(:title,:image)
  end
  
  
end
