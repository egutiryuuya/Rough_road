class GameScore < ApplicationRecord
  belongs_to :game_title
  belongs_to :customer
  has_many :reasons,dependent: :destroy
end
