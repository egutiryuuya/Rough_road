class GameTitle < ApplicationRecord
  has_one_attached :image
  has_many :game_scores ,dependent: :destroy
  validates :image, presence: true
  
  def get_game_title_image
      image.variant(resize_to_fill: [200, 200]).processed
  end
  
  def self.looks(word)
    @game_titles = GameTitle.where("title LIKE?","%#{word}%")
  end
end
