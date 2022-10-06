class GameTitle < ApplicationRecord
  has_one_attached :image
  has_many :game_score ,dependent: :destroy
end
