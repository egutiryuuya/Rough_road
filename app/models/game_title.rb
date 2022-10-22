class GameTitle < ApplicationRecord
  has_many_attached :images
  has_many :game_scores ,dependent: :destroy
  
  def get_game_title_image
    unless images.attached?
      "雅号がありません"
    end
    images.variant(resize_to_fill: [200, 200]).processed
  end
  
  def self.looks(word)
    @game_titles = GameTitle.where("title LIKE?","%#{word}%")
  end
end
