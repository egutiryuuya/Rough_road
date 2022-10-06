class GameScore < ApplicationRecord
  belongs_to :game_title
  belongs_to :customer
  has_many :win_reasons,dependent: :destroy
end
