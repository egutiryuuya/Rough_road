class GameTitle < ApplicationRecord
  has_one_attached :image
  has_many :game_scores ,dependent: :destroy
  
  def get_game_title_image
    unless image.attached?
      画像がありません
    end
    image.variant(resize_to_limit: [250, 250]).processed
  end
end
