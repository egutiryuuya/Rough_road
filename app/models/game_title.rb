class GameTitle < ApplicationRecord
  has_one_attached :image
  has_many :game_scores ,dependent: :destroy
  
  def get_game_title_image
    unless image.attached?
      "雅号がありません"
    end
    image.variant(resize_to_fill: [200, 200]).processed
  end
  
  def self.looks(word)
    @game_titles = GameTitle.where("title LIKE?","%#{word}%")
  end
end
